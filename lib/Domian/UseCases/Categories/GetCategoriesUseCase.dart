import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Repositories/CategoryRepo.dart';
import 'package:injectable/injectable.dart';
import '../../Entities/Categories/CategoryEntity.dart';
import '../Fauilers.dart';

@injectable
class GetCategoriesUseCase {
  CategoryRepository repository;

  GetCategoriesUseCase({required this.repository});

  Future<Either<Fauliers, CategoryResponseEntity>> call() {
    return repository.getCategories();
  }
}
