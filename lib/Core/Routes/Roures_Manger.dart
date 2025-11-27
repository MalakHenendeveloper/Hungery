import 'package:flutter/material.dart';

import 'package:hungery/Core/Routes/App_Routes.dart';
import 'package:hungery/Feature/Auth/Login/Screen/Login_Screen.dart';
import 'package:hungery/Feature/Auth/SIgnUp/Screen/SinUpScreens.dart';
import 'package:hungery/Feature/Cart/Screen/CartScreens.dart';
import 'package:hungery/Feature/CheckOut/Screens/CheckOutScreens.dart';
import 'package:hungery/Feature/OrderHistory/Screen/OrderHistory.dart';
import 'package:hungery/Feature/Home/Screen/HomeScreens.dart';
import 'package:hungery/Feature/MainLayout/Screens/MainLayout.dart';
import 'package:hungery/Feature/Profile/Screen/ProfileScreens.dart';

import '../../Feature/Splash/Screen/Splash_Screens.dart';

class RoutesManger {
  static Route<dynamic>? getRoutes(RouteSettings route) {
    switch (route.name) {
      case App_Routes.splash:
        return MaterialPageRoute(builder: (_) => splashscreen());
      case App_Routes.login:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Fade transition
            var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            );

            return FadeTransition(opacity: fadeAnimation, child: child);
          },
          transitionDuration: Duration(milliseconds: 600),
          settings: route,
        );
      case App_Routes.register:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case App_Routes.main:
        return MaterialPageRoute(builder: (_) => Mainlayout());
      case App_Routes.home:
        return MaterialPageRoute(builder: (_) => Homescreens());
      // case App_Routes.product:
      //   var data = route.arguments as ProductDataEntity;
      //   return MaterialPageRoute(builder: (_) => ProductScreens(data: data));
      case App_Routes.cart:
        return MaterialPageRoute(builder: (_) => Cartscreens());
      case App_Routes.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreens());
      case App_Routes.orderHistory:
        return MaterialPageRoute(builder: (_) => OrderHistory());
      case App_Routes.chekout:
        return MaterialPageRoute(builder: (_) => Checkoutscreens());
      // case App_Routes.register:
      //   return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return null;
    }
  }
}
