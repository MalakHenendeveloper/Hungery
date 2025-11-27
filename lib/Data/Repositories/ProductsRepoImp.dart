import 'package:dartz/dartz.dart';
import 'package:hungery/Data/Data_Source/Products/ProductsDataSource.dart';
import 'package:hungery/Domian/Entities/Products/SIdeEntity.dart';
import 'package:hungery/Domian/Entities/Products/TopEntity.dart';

import 'package:hungery/Domian/Repositories/ProductsRepo.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductsRepositoryImp implements ProductRepository {
  ProductDataSource dataSource;

  ProductsRepositoryImp({required this.dataSource});

  @override
  Future<Either<Fauliers, SideResponseEntity>> getSide() async {
    var either = await dataSource.getSide();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Fauliers, TopResponseEntity>> getTop() async {
    var either = await dataSource.getTop();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
