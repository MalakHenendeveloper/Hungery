import 'package:flutter/material.dart';

class Custtomtext extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  final int? maxLines;
  final TextOverflow? overflow;

  const Custtomtext({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontWeight,
    this.size,
    this.textAlign,
    this.margin,
    this.padding,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
      ),
    );
  }
}
