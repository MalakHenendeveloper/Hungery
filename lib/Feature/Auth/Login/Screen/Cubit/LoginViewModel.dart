import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hungery/Domian/UseCases/Auth/LoginUseCase.dart';
import 'package:hungery/Feature/Auth/Login/Screen/Cubit/LoginState.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase useCase;

  LoginViewModel({required this.useCase}) : super(LoginInatial());
  var email = TextEditingController();
  var password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();

  login() async {
    emit(LoginLoading());
    var result = await useCase.invoke(email.text, password.text);
    result.fold(
      (error) => emit(LoginError(fauliers: error)),
      (success) => emit(LoginSuccess(entity: success)),
    );
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
