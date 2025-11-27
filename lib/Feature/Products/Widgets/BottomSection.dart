import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';

class Bottomsection extends StatelessWidget {
  const Bottomsection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Custtomtext(
            text: title,
            size: 14,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
          GestureDetector(
            onTap: () {
              print("Add pressed");
            },
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 12,
              child: Icon(Icons.add, color: AppColors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
