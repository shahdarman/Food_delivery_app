import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.color,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 22,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.fontFamily ='Instrument Sans',
    this.height = 1.5,
    this.textDirection,
  });

  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final int? maxLines;
  final double? height;
  final String fontFamily;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textDirection: textDirection,
      style: TextStyle(
        height: height,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
        fontFamily: fontFamily,
      ),
    );
  }
}
