import 'package:flutter/material.dart';

class CostumCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final double elevation;
  final Color? color;

  const CostumCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = 24,
    this.elevation = 10,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      margin: margin ?? const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      color: color ?? Colors.white,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
        child: child,
      ),
    );
  }
}