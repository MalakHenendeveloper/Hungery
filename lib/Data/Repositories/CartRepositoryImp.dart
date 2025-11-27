import 'package:dartz/dartz.dart';
import 'package:hungery/Data/Data_Source/Cart/CartDataSource.dart';
import 'package:hungery/Data/Model/Cart/AddToCartDto.dart';
import 'package:hungery/Data/Model/Cart/AddToCartRequest.dart';
import 'package:hungery/Domian/Entities/Cart/getCartEntity.dart';
import 'package:hungery/Domian/Repositories/CartRepository.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImp implements CartRepository {
  CartDataSource dataSource;

  CartRepositoryImp({required this.dataSource});

  @override
  Future<Either<Fauliers, AddToCartDto>> addToCart(
    AddToCartRequest request,
  ) async {
    var either = await dataSource.addToCart(request);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Fauliers, GetCartEntity>> getCart() async {
    var either = await dataSource.getCart();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Fauliers, GetCartEntity>> deleteCart(num id) async {
    var either = await dataSource.deleteCart(id);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
