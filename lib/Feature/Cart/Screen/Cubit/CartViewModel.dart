import 'package:bloc/bloc.dart';
import 'package:hungery/Domian/Entities/Cart/getCartEntity.dart';
import 'package:hungery/Domian/UseCases/Cart/deleteCartUseCase.dart';
import 'package:hungery/Domian/UseCases/Cart/getCartUseCase.dart';
import 'package:hungery/Feature/Cart/Screen/Cubit/CartState.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartState> {
  CartViewModel({required this.cartUseCase, required this.deleteCartUseCase})
    : super(CartInatial());

  GetCartUseCase cartUseCase;
  List<CartItemsEntity> cartList = [];
  GetCartEntity? cartResponse;
  DeleteCartUseCase deleteCartUseCase;

  getCart() async {
    emit(CartLoading());
    var either = await cartUseCase.call();

    either.fold(
      (error) {
        emit(CartError(fauliers: error));
      },
      (response) {
        cartList = response.data!.items!;
        cartResponse = response;
        emit(CartSuccess(cart: response));
      },
    );
  }

  void incrementQuantity(num itemId) {
    final index = cartList.indexWhere((item) => item.itemId == itemId);
    if (index != -1) {
      cartList[index].quantity = (cartList[index].quantity ?? 1) + 1;

      emit(
        CartSuccess(
          cart: GetCartEntity(
            code: cartResponse?.code,
            message: cartResponse?.message,
            data: CartDataEntity(
              id: cartResponse?.data?.id,
              totalPrice: cartResponse?.data?.totalPrice,
              items: cartList,
            ),
          ),
        ),
      );
    }
  }

  void decrementQuantity(num itemId) {
    final index = cartList.indexWhere((item) => item.itemId == itemId);
    if (index != -1 && (cartList[index].quantity ?? 1) > 1) {
      cartList[index].quantity = (cartList[index].quantity ?? 1) - 1;

      emit(
        CartSuccess(
          cart: GetCartEntity(
            code: cartResponse?.code,
            message: cartResponse?.message,
            data: CartDataEntity(
              id: cartResponse?.data?.id,
              totalPrice: cartResponse?.data?.totalPrice,
              items: cartList,
            ),
          ),
        ),
      );
    }
  }

  String getTotalPrice() {
    double total = 0.0;
    for (var item in cartList) {
      final price = double.tryParse(item.price ?? '0') ?? 0.0;
      final quantity = item.quantity ?? 1;
      total += price * quantity;
    }
    return total.toStringAsFixed(2);
  }

  deleteCart(num id) async {
    emit(CartLoading());
    var either = await deleteCartUseCase.call(id);

    either.fold(
      (error) {
        emit(CartError(fauliers: error));
      },
      (response) {
        cartList.removeWhere((item) => item.itemId == id);

        cartResponse = GetCartEntity(
          code: cartResponse?.code,
          message: cartResponse?.message,
          data: CartDataEntity(
            id: cartResponse?.data?.id,
            totalPrice: cartResponse?.data?.totalPrice,
            items: cartList,
          ),
        );

        emit(CartSuccess(cart: cartResponse!));
      },
    );
  }
}
