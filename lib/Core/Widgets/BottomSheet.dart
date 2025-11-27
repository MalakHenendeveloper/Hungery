import 'package:flutter/material.dart';

import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.trailing,
    required this.subtitle,
    this.height,
    this.onTap,
  });

  final double? height;
  final void Function()? onTap;
  final String title;
  final String trailing;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListTile(
        // ✅ أضفت contentPadding عشان نتحكم في المساحات
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        title: Custtomtext(text: title, size: 20, fontWeight: FontWeight.w600),
        subtitle: Custtomtext(
          text: subtitle,
          color: AppColors.primerycolor,
          size: 32,
          fontWeight: FontWeight.w500,
        ),
        trailing: GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            // ✅ خليت الـ width أقل شوية عشان ما يعملش overflow
            width: 180,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.primerycolor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Custtomtext(
              text: trailing,
              size: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
