import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Entities/Categories/CategoryEntity.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';

abstract class CategoryRepository {
  Future<Either<Fauliers, CategoryResponseEntity>> getCategories();
}
