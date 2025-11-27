import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Entities/Cart/getCartEntity.dart';
import 'package:hungery/Domian/Repositories/CartRepository.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';
@injectable
class DeleteCartUseCase {
  CartRepository repository;
  DeleteCartUseCase({required this.repository});
  Future<Either<Fauliers, GetCartEntity>> call(num id) {
    return repository.deleteCart(id);
  }
}
