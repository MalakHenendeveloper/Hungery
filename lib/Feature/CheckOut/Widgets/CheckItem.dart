import 'package:flutter/material.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';

class CheckItem extends StatelessWidget {
  final String title;

  final String price;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;

  const CheckItem({
    super.key,
    required this.title,
    required this.price,
    this.color,
    this.fontWeight,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Custtomtext(
          text: title,
          color: color ?? AppColors.grey,
          size: size ?? 20,
          fontWeight: fontWeight ?? FontWeight.w600,
        ),
        Spacer(),
        Custtomtext(
          text: price,
          color: color ?? AppColors.grey,
          size: size ?? 20,
          fontWeight: fontWeight ?? FontWeight.w600,
        ),
      ],
    );
  }
}
