import 'package:flutter/material.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';

class SaveCard extends StatelessWidget {
  const SaveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(activeColor: AppColors.red, value: true, onChanged: (val) {}),
        Custtomtext(
          text: 'Save card details for future payments',
          size: 16,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
