import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:hungery/Core/constants/images.dart';
import 'package:hungery/Domian/Entities/Products/ProductsEntity.dart';

class Spiceslider extends StatelessWidget {
  final ProductDataEntity data;

  const Spiceslider({
    super.key,
    required this.value,
    this.onChanged,
    required this.data,
  });

  final double value;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          data.image ?? AppImages.product,
          height: 250,
          width: 180,
          cacheWidth: 400,
        ),
        Spacer(),
        Column(
          children: [
            Custtomtext(
              size: 16,
              fontWeight: FontWeight.w500,
              text:
                  'Customize Your Burger\nto Your Tastes.Ultimate\nExperience',
            ),
            Slider(
              activeColor: AppColors.primerycolor,
              min: 0,
              max: 5,
              value: value,
              onChanged: onChanged,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,

              children: [
                Custtomtext(text: '🥶'),
                Gap(100),
                Custtomtext(text: '🌶️'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
