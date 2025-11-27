import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:hungery/Core/constants/images.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppImages.hungry,
              color: AppColors.primerycolor,
              height: 42,
            ),
            Custtomtext(
              text: "Hello, Malak Henen",
              size: 18,
              color: AppColors.grey,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(radius: 32),
      ],
    );
  }
}
