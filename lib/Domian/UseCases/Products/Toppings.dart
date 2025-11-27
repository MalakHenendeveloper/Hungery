import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Repositories/ProductsRepo.dart';
import 'package:injectable/injectable.dart';
import '../../Entities/Products/TopEntity.dart';
import '../Fauilers.dart';

@injectable
class GetTopUseCase {
  ProductRepository repository;

  GetTopUseCase({required this.repository});

  Future<Either<Fauliers, TopResponseEntity>> call() {
    return repository.getTop();
  }
}
