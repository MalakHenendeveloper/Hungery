import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungery/Core/Widgets/CustomTextFrom.dart';
import 'package:hungery/Core/constants/colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      boxShadow: BoxShadow(
        color: AppColors.black,
        blurRadius: 3,
        spreadRadius: 0.6,
      ),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      prefixIcon: Icon(CupertinoIcons.search),
      hintText: 'Search',
    );
  }
}
