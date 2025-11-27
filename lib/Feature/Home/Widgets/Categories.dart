import 'package:flutter/material.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:hungery/Feature/Home/Screen/Cubit/HomeViewModel.dart';

class Categories extends StatelessWidget {
  final HomeViewModel viewmodel;

  Categories({super.key, required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(viewmodel.categories.length, (index) {
          return GestureDetector(
            onTap: () {
              viewmodel.changeCategory(index);
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 27),
              decoration: BoxDecoration(
                color: viewmodel.selectindex == index
                    ? AppColors.primerycolor
                    : AppColors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Custtomtext(
                text: viewmodel.categories[index].name ?? "",
                size: 16,
                color: viewmodel.selectindex == index
                    ? AppColors.white
                    : AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }),
      ),
    );
  }
}
