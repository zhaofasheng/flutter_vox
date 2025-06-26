import 'dart:io';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int maxLines;
  final TextOverflow overflow;

  const AppText(
      this.text, {
        super.key,
        required this.fontSize,
        this.color,
        this.fontWeight,
        this.textAlign,
        this.maxLines = 1,
        this.overflow = TextOverflow.ellipsis, // ✅ 默认防止溢出
      });

  double get _platformFontSize {
    return Platform.isAndroid ? fontSize - 1 : fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: _platformFontSize,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      textScaler: const TextScaler.linear(1.0),
    );
  }
}