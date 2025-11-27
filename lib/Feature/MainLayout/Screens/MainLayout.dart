import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:hungery/Core/constants/images.dart';
import 'package:hungery/Feature/MainLayout/Screens/Cubit/MainLayoutState.dart';

import '../Widgets/CustomNavigationBar.dart';
import 'Cubit/MainViewModel.dart';

class Mainlayout extends StatelessWidget {
  Mainlayout({super.key});

  var viewmodel = MainLayoutviewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutviewModel, MainLayoutState>(
      bloc: viewmodel,
      builder: (context, state) {
        return Scaffold(
          body: viewmodel.tabs[viewmodel.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColors.primerycolor,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.all(10),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                viewmodel.changeSelect(index);
              },
              selectedItemColor: AppColors.white,
              unselectedItemColor: AppColors.grey,
              elevation: 0,
              iconSize: 35,
              currentIndex: viewmodel.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.command),
                  label: 'orderHistory',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled),
                  label: 'User',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
