import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Entities/Auth/LoginEntity.dart';
import 'package:hungery/Domian/Entities/Auth/RegisterEntity.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';

abstract class AuthRepository {
  Future<Either<Fauliers, RegisterEntity>> register(
    String name,
    String email,
    String password,
    String phone,
  );

  Future<Either<Fauliers, LoginEntity>> login(String email, String password);
}
