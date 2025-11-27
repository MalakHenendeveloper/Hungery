import 'package:dartz/dartz.dart';
import 'package:hungery/Data/Data_Source/Home/HomeDataSource.dart';
import 'package:hungery/Domian/Entities/Products/ProductsEntity.dart';
import 'package:hungery/Domian/Repositories/HomeRepository.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
  HomeDataSource homeDataSource;

  HomeRepositoryImp({required this.homeDataSource});

  @override
  Future<Either<Fauliers, ProductsEntity>> getProducts() async {
    var either = await homeDataSource.getProducts();
    return either.fold((error) => Left(error), (success) => Right(success));
  }
}
