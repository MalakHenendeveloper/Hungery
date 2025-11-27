import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungery/Core/Routes/App_Routes.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:hungery/Core/constants/images.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _imageController;

  late Animation<double> _logoScale;
  late Animation<double> _logoFade;
  late Animation<double> _imageScale;
  late Animation<double> _imageFade;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _imageController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _logoScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _imageScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.elasticOut),
    );

    _imageFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _imageController,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _logoController.forward();

    Future.delayed(Duration(milliseconds: 400), () {
      if (mounted) {
        _imageController.forward();
      }
    });

    Future.delayed(Duration(milliseconds: 2500), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, App_Routes.login);
      }
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Gap(300),

                      AnimatedBuilder(
                        animation: _logoController,
                        builder: (context, child) {
                          return FadeTransition(
                            opacity: _logoFade,
                            child: ScaleTransition(
                              scale: _logoScale,
                              child: SvgPicture.asset(AppImages.hungry),
                            ),
                          );
                        },
                      ),
                      Spacer(),

                      AnimatedBuilder(
                        animation: _imageController,
                        builder: (context, child) {
                          return FadeTransition(
                            opacity: _imageFade,
                            child: ScaleTransition(
                              scale: _imageScale,
                              child: Image.asset(AppImages.splash),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
