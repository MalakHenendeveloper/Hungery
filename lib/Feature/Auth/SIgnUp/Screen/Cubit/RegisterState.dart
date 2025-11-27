import 'package:hungery/Domian/Entities/Auth/RegisterEntity.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccess extends RegisterState {
  RegisterEntity registerEntity;

  RegisterSuccess({required this.registerEntity});
}

class RegisterError extends RegisterState {
  Fauliers fauliers;

  RegisterError({required this.fauliers});
}
