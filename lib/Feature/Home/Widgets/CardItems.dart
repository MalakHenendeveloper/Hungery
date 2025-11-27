import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../Domian/Entities/Products/ProductsEntity.dart';

class Carditems extends StatelessWidget {
  final ProductDataEntity data;

  const Carditems({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: data == null,
      child: Card(
        elevation: 20,
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.network(
                    data.image!,
                    fit: BoxFit.contain,
                    cacheWidth: 400,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                          color: AppColors.primerycolor,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error, color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Custtomtext(
                text: data.name ?? 'Cheeseburger\nWendy Burger',
                fontWeight: FontWeight.w600,
                size: 16,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Custtomtext(
                    text: data.price ?? '\$ 8.00',
                    fontWeight: FontWeight.w500,
                    size: 16,
                    color: AppColors.primerycolor,
                  ),
                  const Spacer(),
                  Icon(
                    CupertinoIcons.heart_fill,
                    color: AppColors.primerycolor,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
