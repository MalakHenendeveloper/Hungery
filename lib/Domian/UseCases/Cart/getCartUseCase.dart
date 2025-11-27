import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Repositories/CartRepository.dart';
import '../../Entities/Cart/getCartEntity.dart';
import '../Fauilers.dart';

@injectable
class GetCartUseCase {
  CartRepository repo;

  GetCartUseCase({required this.repo});

  Future<Either<Fauliers, GetCartEntity>> call() {
    return repo.getCart();
  }
}
