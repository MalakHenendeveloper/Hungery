import 'package:flutter/material.dart';
import 'package:hungery/Core/constants/colors.dart';

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;

  CustomBottomNavBarItem(this.iconPath, this.title)
    : super(
        label: title,
        icon: ImageIcon(AssetImage(iconPath)),
        activeIcon: CircleAvatar(child: ImageIcon(AssetImage(iconPath))),
      );
}
