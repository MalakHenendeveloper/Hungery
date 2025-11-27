import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ModernFeedback {
  static void show(
    BuildContext context, {
    required String title,
    required String message,
    required bool isSuccess,
  }) {
    // Remove current SnackBar if any
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _GlassFeedbackCard(
          title: title,
          message: message,
          isSuccess: isSuccess,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
        padding: EdgeInsets.zero,
      ),
    );
  }
}

class _GlassFeedbackCard extends StatelessWidget {
  final String title;
  final String message;
  final bool isSuccess;

  const _GlassFeedbackCard({
    required this.title,
    required this.message,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = isSuccess
        ? const Color(0xff08431D)
        : Colors.redAccent;
    final IconData icon = isSuccess
        ? Icons.check_circle_outline
        : Icons.error_outline;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: primaryColor, size: 28),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
