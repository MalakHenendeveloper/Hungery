import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hungery/Domian/UseCases/Auth/RegisterUseCase.dart';
import 'package:hungery/Feature/Auth/SIgnUp/Screen/Cubit/RegisterState.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase useCase;

  RegisterViewModel({required this.useCase}) : super(RegisterInitialState());
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();

  void register() async {
    emit(RegisterLoadingState());
    var either = await useCase.invoke(
      name.text,
      email.text,
      password.text,
      phone.text,
    );
    either.fold(
      (error) {
        emit(RegisterError(fauliers: error));
      },
      (success) {
        emit(RegisterSuccess(registerEntity: success));
      },
    );
  }

  @override
  Future<void> close() {
    name.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    return super.close();
  }
}
