import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Repositories/AuthRepository.dart';
import 'package:injectable/injectable.dart';

import '../../Entities/Auth/LoginEntity.dart';
import '../Fauilers.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Fauliers, LoginEntity>> invoke(String email, String password) {
    return authRepository.login(email, password);
  }
}
