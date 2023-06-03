import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final Color? backgroundColor;
  final double thickness;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final List<BoxShadow>? boxShadow;
  final bool disabled;

  const AppContainer({
    super.key,
    required this.child,
    this.borderColor = Colors.black,
    this.backgroundColor,
    this.thickness = 2.0,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.boxShadow,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(boxShadow: boxShadow),
      child: CustomPaint(
        isComplex: true,
        foregroundPainter: _BorderPainter(
          color:disabled?Colors.transparent: borderColor,
          thickness: thickness,
        ),
        child: Container(
          height: height,
          width: width,
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
