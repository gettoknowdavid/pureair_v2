import 'package:flutter/material.dart';

class AppContainer extends Container {
  final Color? borderColor;
  final Color? backgroundColor;
  final double thickness;
  final double? height;
  final double? width;
  final List<BoxShadow>? boxShadow;
  final bool disabled;
  final Duration duration;

  AppContainer({
    super.key,
    super.child,
    this.duration = const Duration(milliseconds: 350),
    this.borderColor,
    this.backgroundColor,
    this.thickness = 2.0,
    this.width,
    this.height,
    super.margin,
    super.padding,
    this.boxShadow,
    super.alignment,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedContainer(
      duration: duration,
      curve: Curves.fastOutSlowIn,
      margin: margin,
      decoration: BoxDecoration(boxShadow: boxShadow),
      child: CustomPaint(
        isComplex: true,
        foregroundPainter: _BorderPainter(
          color: disabled
              ? Colors.transparent
              : borderColor ?? colorScheme.onBackground,
          thickness: thickness,
        ),
        child: Container(
          height: height,
          width: width,
          alignment: alignment,
          color: backgroundColor,
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class _BorderPainter extends CustomPainter {
  final Color color;
  final double thickness;

  _BorderPainter({required this.color, required this.thickness});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRebuildSemantics(_BorderPainter oldDelegate) => false;

  @override
  bool shouldRepaint(_BorderPainter oldDelegate) =>
      color != oldDelegate.color || thickness != oldDelegate.thickness;
}
