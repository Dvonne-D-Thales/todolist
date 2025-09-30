import 'package:flutter/material.dart';

class CostumText extends StatelessWidget {
  final String data;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;

  const CostumText(
    this.data, {
    super.key,
    this.size,
    this.weight,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
  });

  /// Heading style
  factory CostumText.heading(String data) {
    return CostumText(
      data,
      size: 26,
      weight: FontWeight.bold,
      color: Colors.deepPurple,
      letterSpacing: 1.2,
    );
  }

  /// Subtitle / description
  factory CostumText.subtitle(String data) {
    return CostumText(
      data,
      size: 15,
      weight: FontWeight.w500,
      color: Colors.grey,
    );
  }

  /// Body / default text
  factory CostumText.body(String data) {
    return CostumText(
      data,
      size: 14,
      weight: FontWeight.normal,
      color: Colors.black87,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
