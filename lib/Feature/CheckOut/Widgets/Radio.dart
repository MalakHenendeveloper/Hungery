import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:hungery/Core/constants/images.dart';

class PaymentSelect extends StatelessWidget {
  final bool showCash;
  final bool showVisa;

  const PaymentSelect({
    super.key,
    required this.showCash,
    required this.showVisa,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showCash)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.toppigcolor,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              leading: Image.asset(AppImages.cash),
              title: Custtomtext(
                padding: EdgeInsets.symmetric(vertical: 20),
                text: 'Cash on Delivery',
                color: AppColors.white,
                size: 20,
                fontWeight: FontWeight.w700,
              ),
              trailing: Radio(
                activeColor: AppColors.white,
                value: 'cash',
                onChanged: (value) {},
                groupValue: 'cash',
              ),
            ),
          ),
        Gap(15),
        if (showVisa)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.visacolor,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              leading: Image.asset(AppImages.visa),
              title: Custtomtext(
                text: 'Visa Card',

                size: 20,
                fontWeight: FontWeight.w700,
              ),
              trailing: Radio(
                value: 'visa',
                onChanged: (value) {},
                groupValue: 'cash',
              ),
              subtitle: Custtomtext(
                padding: EdgeInsets.symmetric(vertical: 10),
                text: '3566 **** **** 0505',
                size: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
              ),
            ),
          ),
      ],
    );
  }
}
