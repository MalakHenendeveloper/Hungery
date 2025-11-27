import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Entities/Products/ProductsEntity.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';

abstract class HomeDataSource {
  Future<Either<Fauliers, ProductsEntity>> getProducts();
}
