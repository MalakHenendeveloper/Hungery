import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Entities/Auth/RegisterEntity.dart';
import 'package:hungery/Domian/Repositories/AuthRepository.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepository auth;

  RegisterUseCase({required this.auth});

  Future<Either<Fauliers, RegisterEntity>> invoke(
    String name,
    String email,
    String password,
    String phone,
  ) {
    return auth.register(name, email, password, phone);
  }
}
