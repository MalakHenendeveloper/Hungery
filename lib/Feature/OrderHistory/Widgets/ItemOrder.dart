import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:hungery/Core/constants/images.dart';

class Itemorder extends StatelessWidget {
  final String title;
  final String count;
  final String price;
  final String textButton;

  const Itemorder({
    super.key,
    required this.title,
    required this.count,
    required this.price,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: Offset(0, 8),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(AppImages.burger, fit: BoxFit.cover),
                ),
              ),
              Gap(16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Custtomtext(
                            text: title,
                            size: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primerycolor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Custtomtext(
                            text: price,
                            size: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primerycolor,
                          ),
                        ),
                      ],
                    ),
                    Gap(8),
                    Row(
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: 16,
                          color: Colors.grey[500],
                        ),
                        Gap(5),
                        Custtomtext(
                          text: count,
                          size: 14,
                          color: Colors.grey[600]!,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Gap(8),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey[500],
                        ),
                        Gap(5),
                        Custtomtext(
                          text: '20 Nov, 12:30 PM',
                          size: 13,
                          color: Colors.grey[500]!,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primerycolor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadowColor: AppColors.primerycolor.withOpacity(0.4),
              ),
              child: Text(
                textButton,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
