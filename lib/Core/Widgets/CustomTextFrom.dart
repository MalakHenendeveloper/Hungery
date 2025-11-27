import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungery/Core/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final Color? hintColor;
  final Color? lebalColor;
  final String? lebal;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final BorderRadius? borderRadius;
  final BoxShadow? boxShadow;
  final Color? fillColor;
  final Color? color;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.padding,
    this.margin,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.prefixIcon,
    this.borderRadius,
    this.boxShadow,
    this.fillColor,
    this.color,
    this.lebal,
    this.hintColor,
    this.lebalColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        boxShadow: boxShadow != null ? [boxShadow!] : [],
      ),

      padding: padding,
      margin: margin,
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.primerycolor,
        cursorHeight: 30,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: obscureText
              ? const Icon(CupertinoIcons.eye_slash_fill)
              : null,
          hintText: hintText,
          labelText: lebal,
          hintStyle: TextStyle(
            color: hintColor ?? AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          labelStyle: TextStyle(
            color: lebalColor ?? AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(color: color ?? AppColors.white),
          ),
          fillColor: fillColor ?? AppColors.white,
          filled: true,
        ),
      ),
    );
  }
}
