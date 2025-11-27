import 'package:dartz/dartz.dart';
import 'package:hungery/Core/Api_Manger/Apis.dart';
import 'package:hungery/Core/Api_Manger/Endpoients.dart';
import 'package:hungery/Core/Widgets/CustomSharedPref.dart';
import 'package:hungery/Data/Data_Source/Cart/CartDataSource.dart';
import 'package:hungery/Data/Model/Cart/AddToCartDto.dart';
import 'package:hungery/Data/Model/Cart/AddToCartRequest.dart';
import 'package:hungery/Data/Model/Cart/getCartDto.dart';
import 'package:hungery/Domian/Entities/Cart/getCartEntity.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartDataSource)
class CartDataSourceImp implements CartDataSource {
  ApiManger apiManger;

  CartDataSourceImp({required this.apiManger});

  @override
  Future<Either<Fauliers, AddToCartDto>> addToCart(
    AddToCartRequest request,
  ) async {
    try {
      var token = await CustomSharedPref.getData(key: 'token');

      // ⚠️ التحقق من وجود الـ token
      if (token == null || token.toString().isEmpty) {
        return Left(
          NetworkError(
            ErrorMassage: 'No authentication token. Please login again.',
          ),
        );
      }

      var response = await apiManger.postDate(
        EndPoints.addCart,
        body: request.toJson(),

        headers: {
          'Authorization': 'Bearer ${token.toString()}',
          'Accept': 'application/json',
        },
      );

      var cartResponse = AddToCartDto.fromJson(response.data);

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return Right(cartResponse);
      } else {
        return Left(ServerError(ErrorMassage: response.statusMessage!));
      }
    } catch (e) {
      return Left(NetworkError(ErrorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Fauliers, GetCartEntity>> getCart() async {
    try {
      var token = await CustomSharedPref.getData(key: 'token');
      var response = await apiManger.getDate(
        EndPoints.getCart,
        headers: {
          'Authorization': 'Bearer ${token.toString()}',
          'Accept': 'application/json',
        },
      );
      var getCartResponse = GetCartDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return Right(getCartResponse);
      } else {
        return Left(ServerError(ErrorMassage: response.statusMessage!));
      }
    } catch (e) {
      return Left(NetworkError(ErrorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Fauliers, GetCartEntity>> deleteCart(num id) async {
    try {
      var token = await CustomSharedPref.getData(key: 'token');
      var response = await apiManger.deleteDate(
        "${EndPoints.deleteCart}/$id",
        headers: {
          'Authorization': 'Bearer ${token.toString()}',
          'Accept': 'application/json',
        },
      );
      var deleteResponse =  GetCartDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return Right(deleteResponse);
      } else {
        return Left(ServerError(ErrorMassage: response.statusMessage!));
      }
    } catch (e) {
      return Left(NetworkError(ErrorMassage: e.toString()));
    }
  }
}
