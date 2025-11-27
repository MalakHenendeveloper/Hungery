import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Entities/Products/SIdeEntity.dart';
import 'package:hungery/Domian/Repositories/ProductsRepo.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSideUseCase {
  ProductRepository repository;
  GetSideUseCase({required this.repository});
Future<Either<Fauliers, SideResponseEntity>>  call() {
    return repository.getSide();
  }
}
