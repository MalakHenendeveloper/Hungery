import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Entities/Products/TopEntity.dart';

import '../../../Domian/Entities/Products/SIdeEntity.dart';

import '../../../Domian/UseCases/Fauilers.dart';

abstract class ProductDataSource {
  Future<Either<Fauliers, TopResponseEntity>> getTop();

  Future<Either<Fauliers, SideResponseEntity>> getSide();
}
