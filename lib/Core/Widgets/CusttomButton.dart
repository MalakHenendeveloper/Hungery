import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;

  // void Function()? onTap;
  final VoidCallback? onTap;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  Custombutton({
    super.key,
    required this.child,
    this.borderRadius,
    this.color,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(borderRadius: borderRadius, color: color),
        child: child,
      ),
    );
  }
}
