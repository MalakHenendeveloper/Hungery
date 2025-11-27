import 'package:gap/gap.dart';
import 'package:hungery/Core/Injectable/Injectable.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:hungery/Feature/Home/Widgets/GridView.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Widgets/CardItems.dart';
import '../Widgets/Categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungery/Feature/Home/Screen/Cubit/HomeState.dart';
import 'package:hungery/Feature/Home/Screen/Cubit/HomeViewModel.dart';
import 'package:hungery/Feature/Home/Widgets/Header.dart';
import 'package:hungery/Feature/Home/Widgets/Search.dart';

class Homescreens extends StatelessWidget {
  Homescreens({super.key});

  var viewmodel = getIt<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeState>(
      bloc: viewmodel
        ..getProducts()
        ..getCategories(),
      builder: (context, state) {
        if (state is HomeError) {
          return Scaffold(body: Center(child: Text(state.mas)));
        }
        if (state is HomeSuccess) {
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return Opacity(
                opacity: value.clamp(0.0, 1.0),
                child: Transform.scale(
                  scale: (0.95 + (value * 0.05)).clamp(0.95, 1.0),
                  child: Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                Gap(70),
                                Header(),
                                Search(),
                                Categories(viewmodel: viewmodel),
                                Gap(15),
                              ],
                            ),
                          ),
                          CustomSliverGrid(viewModel: viewmodel),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return Center(
          child: LoadingAnimationWidget.twistingDots(
            leftDotColor: AppColors.primerycolor,
            rightDotColor: AppColors.visacolor,
            size: 120,
          ),
        );
      },
    );
  }
}
