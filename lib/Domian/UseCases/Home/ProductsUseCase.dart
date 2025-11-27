import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Repositories/HomeRepository.dart';
import 'package:injectable/injectable.dart';

import '../../Entities/Products/ProductsEntity.dart';
import '../Fauilers.dart';

@injectable
class ProductUseCase {
  HomeRepository homeRepository;

  ProductUseCase({required this.homeRepository});

  Future<Either<Fauliers, ProductsEntity>> invoke() {
    return homeRepository.getProducts();
  }
}
