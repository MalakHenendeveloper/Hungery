import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Entities/Products/SIdeEntity.dart';
import 'package:hungery/Domian/Entities/Products/TopEntity.dart';

import 'package:hungery/Domian/UseCases/Fauilers.dart';

abstract class ProductRepository {
  Future<Either<Fauliers, TopResponseEntity>> getTop();

  Future<Either<Fauliers, SideResponseEntity>> getSide();
}
