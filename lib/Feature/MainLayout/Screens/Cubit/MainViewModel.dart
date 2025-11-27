import 'package:bloc/bloc.dart';
import 'package:hungery/Feature/Cart/Screen/CartScreens.dart';
import 'package:hungery/Feature/OrderHistory/Screen/OrderHistory.dart';
import 'package:hungery/Feature/Home/Screen/HomeScreens.dart';
import 'package:hungery/Feature/MainLayout/Screens/Cubit/MainLayoutState.dart';
import 'package:flutter/material.dart';
import 'package:hungery/Feature/Profile/Screen/ProfileScreens.dart';

class MainLayoutviewModel extends Cubit<MainLayoutState> {
  MainLayoutviewModel() : super(MainLayoutstateInatial());
  int currentIndex = 0;
  List<Widget> tabs = [
    Homescreens(),
    Cartscreens(),
    OrderHistory(),
    ProfileScreens(),
  ];

  changeSelect(int selectindex) {
    emit(MainLayoutstateInatial());
    currentIndex = selectindex;
    emit(ChangeSelectIndex());
  }

  void goToCart() {
    currentIndex = 1;
    emit(ChangeSelectIndex());
  }
}
