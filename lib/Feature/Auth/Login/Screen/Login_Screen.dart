import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungery/Core/Injectable/Injectable.dart';
import 'package:hungery/Core/Routes/App_Routes.dart';
import 'package:hungery/Core/Widgets/CustomTextFrom.dart';
import 'package:hungery/Core/Widgets/CusttomButton.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/Widgets/ModernFeedback.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:hungery/Core/constants/images.dart';
import 'package:hungery/Feature/Auth/Login/Screen/Cubit/LoginState.dart';
import 'package:hungery/Feature/Auth/Login/Screen/Cubit/LoginViewModel.dart';

import '../../../../Core/Widgets/valdator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var viewmodel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
      bloc: viewmodel,
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
              child: CircularProgressIndicator(color: AppColors.white),
            ),
          );
        } else if (state is LoginSuccess) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }

          ModernFeedback.show(
            context,
            title: 'Success',
            message: 'Login Successful!',
            isSuccess: true,
          );

          Future.delayed(Duration(milliseconds: 1500), () {
            Navigator.pushNamed(context, App_Routes.main);
          });
        } else if (state is LoginError) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }

          ModernFeedback.show(
            context,
            title: 'Error',
            message: state.fauliers.ErrorMassage,
            isSuccess: false,
          );
        }
      },
      child: GestureDetector(
        onTap: () {},
        child: Scaffold(
          backgroundColor: AppColors.primerycolor,
          body: Stack(
            children: [
              Positioned(
                bottom: -50,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    AppImages.burger,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                ),
              ),

              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Form(
                            key: viewmodel.formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(AppImages.hungry, height: 80),
                                Gap(15),
                                Custtomtext(
                                  text: 'Welcome Back!',
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  size: 24,
                                ),
                                Gap(5),
                                Custtomtext(
                                  text: 'Discover the best food',
                                  color: AppColors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w400,
                                  size: 16,
                                ),
                                Gap(30),
                                CustomTextFormField(
                                  controller: viewmodel.email,
                                  validator: AppValidator.ValidEmail,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  hintText: 'Email Address',
                                  fillColor: Colors.white.withOpacity(0.9),
                                ),
                                CustomTextFormField(
                                  controller: viewmodel.password,
                                  obscureText: true,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  hintText: 'Password',
                                  fillColor: Colors.white.withOpacity(0.9),
                                ),
                                Custombutton(
                                  margin: EdgeInsets.symmetric(vertical: 25),
                                  onTap: () {
                                    if (viewmodel.formkey.currentState!
                                        .validate()) {
                                      viewmodel.login();
                                    }
                                  },
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Custtomtext(
                                    textAlign: TextAlign.center,
                                    text: 'Login',
                                    size: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primerycolor,
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Custtomtext(
                                      text: "Don't have an account? ",
                                      color: AppColors.white.withOpacity(0.9),
                                      size: 14,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          App_Routes.register,
                                        );
                                      },
                                      child: Custtomtext(
                                        text: 'Sign Up',
                                        color: AppColors.white,
                                        size: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
