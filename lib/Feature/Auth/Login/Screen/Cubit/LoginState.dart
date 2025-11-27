import 'package:hungery/Domian/Entities/Auth/LoginEntity.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';

abstract class LoginState {}

class LoginInatial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginEntity entity;

  LoginSuccess({required this.entity});
}

class LoginError extends LoginState {
  Fauliers fauliers;

  LoginError({required this.fauliers});
}
