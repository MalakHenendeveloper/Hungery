import 'package:flutter/material.dart';
import 'package:hungery/Core/constants/colors.dart';

class Items extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  const Items({
    super.key,
    required this.image,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 110,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected
              ? AppColors.primerycolor.withOpacity(0.05)
              : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.primerycolor : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Increased opacity
              blurRadius: 12, // Increased blur
              spreadRadius: 2, // Increased spread
              offset: const Offset(0, 6), // Slightly larger offset
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? Colors.white
                        : AppColors.visacolor.withOpacity(0.3),
                  ),
                  child: image.startsWith('http')
                      ? Image.network(
                          image,
                          height: 60,
                          width: 60,
                          cacheWidth: 150,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error, color: Colors.red),
                        )
                      : Image.asset(
                          image,
                          height: 60,
                          width: 60,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.image_not_supported,
                                color: Colors.grey,
                              ),
                        ),
                ),
                if (isSelected)
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.primerycolor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? AppColors.primerycolor : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
