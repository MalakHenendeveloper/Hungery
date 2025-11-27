import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:hungery/Domian/Entities/Cart/getCartEntity.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.data,
    required this.onIncrement,
    required this.onDecrement,
    required this.delete,
  });

  final CartItemsEntity data;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback delete;

  @override
  Widget build(BuildContext context) {
    final isMinQuantity = (data.quantity ?? 1) <= 1;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 20,
            offset: Offset(0, 8),
            spreadRadius: 1,
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              child: Image.network(
                data.image!,
                fit: BoxFit.cover,
                cacheWidth: 200,
                cacheHeight: 200,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ),

          Gap(15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Custtomtext(
                        text: data.name!,
                        size: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    InkWell(
                      onTap: delete,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),

                Gap(5),

                Custtomtext(
                  text: '\$ ${data.price}',
                  color: AppColors.primerycolor,
                  size: 18,
                  fontWeight: FontWeight.bold,
                ),

                Gap(10),

                Row(
                  children: [
                    _buildQuantityButton(
                      icon: Icons.remove,
                      onTap: isMinQuantity ? null : onDecrement,
                      isEnabled: !isMinQuantity,
                    ),

                    Container(
                      constraints: BoxConstraints(minWidth: 40),
                      child: Center(
                        child: Custtomtext(
                          text: '${data.quantity}',
                          size: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                    _buildQuantityButton(
                      icon: Icons.add,
                      onTap: onIncrement,
                      isEnabled: true,
                      isAdd: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback? onTap,
    required bool isEnabled,
    bool isAdd = false,
  }) {
    return InkWell(
      onTap: () {
        if (isEnabled && onTap != null) {
          HapticFeedback.lightImpact();
          onTap();
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isAdd
              ? AppColors.primerycolor
              : (isEnabled ? Colors.white : Colors.grey[100]),
          borderRadius: BorderRadius.circular(10),
          border: isAdd
              ? null
              : Border.all(
                  color: isEnabled ? Colors.grey[300]! : Colors.grey[200]!,
                ),
          boxShadow: isAdd
              ? [
                  BoxShadow(
                    color: AppColors.primerycolor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Icon(
          icon,
          size: 18,
          color: isAdd
              ? Colors.white
              : (isEnabled ? Colors.black87 : Colors.grey[400]),
        ),
      ),
    );
  }
}
