import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungery/Core/Routes/App_Routes.dart';
import 'package:hungery/Core/Routes/Roures_Manger.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

import 'Core/Injectable/Injectable.dart';
import 'Core/Widgets/Bloc.dart';
import 'Feature/MainLayout/Screens/Cubit/MainViewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferences.getInstance();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    log(details.exception.toString(), name: "❌ FlutterError");
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    log(details.toString(), name: '❌ WidgetError');
    return Center(
      child: Text(
        'Error: ${details.exception}',
        style: const TextStyle(color: Colors.red, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainLayoutviewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: App_Routes.splash,
        onGenerateRoute: RoutesManger.getRoutes,
      ),
    );
  }
}
