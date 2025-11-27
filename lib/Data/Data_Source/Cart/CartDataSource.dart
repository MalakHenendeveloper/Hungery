import 'package:dartz/dartz.dart';
import 'package:hungery/Data/Model/Cart/AddToCartDto.dart';
import 'package:hungery/Data/Model/Cart/AddToCartRequest.dart';
import 'package:hungery/Domian/Entities/Cart/getCartEntity.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';

abstract class CartDataSource {
  Future<Either<Fauliers, AddToCartDto>> addToCart(AddToCartRequest request);

  Future<Either<Fauliers, GetCartEntity>> getCart();
Future<Either<Fauliers, GetCartEntity>> deleteCart(num id);
}
