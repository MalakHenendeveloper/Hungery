import 'package:dartz/dartz.dart';
import 'package:hungery/Data/Data_Source/Auth/AuthDataSource.dart';
import 'package:hungery/Domian/Entities/Auth/LoginEntity.dart';
import 'package:hungery/Domian/Entities/Auth/RegisterEntity.dart';
import 'package:hungery/Domian/Repositories/AuthRepository.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp extends AuthRepository {
  AuthDataSource authDataSource;

  AuthRepositoryImp({required this.authDataSource});

  @override
  Future<Either<Fauliers, RegisterEntity>> register(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    var either = await authDataSource.register(name, email, password, phone);
    return either.fold((error) => Left(error), (success) => Right(success));
  }

  @override
  Future<Either<Fauliers, LoginEntity>> login(
    String email,
    String password,
  ) async {
    var either = await authDataSource.login(email, password);
    return either.fold((error) => Left(error), (success) => Right(success));
  }
}
