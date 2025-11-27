import 'package:dartz/dartz.dart';
import 'package:hungery/Data/Data_Source/Categories/CategoryDataSource.dart';
import 'package:hungery/Domian/Entities/Categories/CategoryEntity.dart';
import 'package:hungery/Domian/Repositories/CategoryRepo.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImp implements CategoryRepository {
  CategoryDataSource dataSource;

  CategoryRepositoryImp({required this.dataSource});

  @override
  Future<Either<Fauliers, CategoryResponseEntity>> getCategories() {
    return dataSource.getCategories();
  }
}
