import 'package:bloc/bloc.dart';
import 'package:hungery/Data/Model/Cart/AddToCartDto.dart';
import 'package:hungery/Data/Model/Cart/AddToCartRequest.dart';
import 'package:hungery/Domian/Entities/Products/SIdeEntity.dart';
import 'package:hungery/Domian/UseCases/Products/Side.dart';
import 'package:hungery/Domian/UseCases/Products/Toppings.dart';
import 'package:hungery/Feature/Products/Screen/Cubit/ProductState.dart';
import 'package:injectable/injectable.dart';

import '../../../../Domian/Entities/Products/TopEntity.dart';
import '../../../../Domian/UseCases/Cart/AddCartUseCase.dart';

@injectable
class ProductViewModel extends Cubit<ProductState> {
  GetSideUseCase sideUseCase;
  GetTopUseCase getTopUseCase;
  AddToCartUseCase cart;

  List<SideEntity> sideList = [];
  List<TopEntity> topList = [];
  List<ItemsCart> cartList = [];

  double value = 0.0;
  int quantity = 1;

  List<num> selectedToppings =
      []; // مثال: [1, 3, 5] - المستخدم اختار إضافات رقم 1 و 3 و 5
  List<num> selectedSideOptions =
      []; // مثال: [2, 4] - المستخدم اختار خيارات رقم 2 و 4

  ProductViewModel({
    required this.sideUseCase,
    required this.getTopUseCase,
    required this.cart,
  }) : super(ProductInitial());

  void getSide() async {
    emit(ProductSideLoading());

    var either = await sideUseCase.call();

    either.fold((error) => emit(ProductSideError(message: error)), (success) {
      sideList = success.data!;
      emit(ProductSideSuccess(sideEntity: success));
    });
  }

  void getTop() async {
    emit(ProductTopLoading());

    var either = await getTopUseCase.call();

    either.fold((error) => emit(ProductTopError(message: error)), (success) {
      topList = success.data!;
      emit(ProductTopSuccess(top: success));
    });
  }

  void toggleTopping(num toppingId) {
    if (selectedToppings.contains(toppingId)) {
      selectedToppings.remove(toppingId); // إزالة
    } else {
      selectedToppings.add(toppingId); // إضافة
    }
    emit(SelectionUpdated()); // إشعار الـ UI بالتحديث
  }

  void toggleSideOption(num sideOptionId) {
    if (selectedSideOptions.contains(sideOptionId)) {
      selectedSideOptions.remove(sideOptionId); // إزالة
    } else {
      selectedSideOptions.add(sideOptionId); // إضافة
    }
    emit(SelectionUpdated()); // إشعار الـ UI بالتحديث
  }

  void incrementQuantity() {
    quantity++;
    emit(QuantityUpdated(quantity));
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      emit(QuantityUpdated(quantity));
    }
  }

  addToCart({
    required num productId,
    required num quantity,
    num? spicy,
    required List<num> toppings,
    required List<num> sideOptions,
  }) async {
    emit(AddToCartLoading());

    final cartItem = CartItemRequest(
      productId: productId,
      quantity: quantity,
      spicy: spicy! > 0 ? 1 : 0,
      toppings: toppings,
      sideOptions: sideOptions,
    );

    final request = AddToCartRequest(items: [cartItem]);

    var either = await cart.call(request);

    either.fold((error) => emit(AddToCartError(message: error)), (success) {
      cartList = success.items ?? [];
      emit(AddToCartSuccess(itemsCart: success));
    });
  }

  ChengeSlider(double val) {
    value = val;
    emit(ChengeSliderState(value));
  }
}
