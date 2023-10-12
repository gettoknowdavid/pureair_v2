import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final Color? color;
  final double thickness;
  final double dashLength;
  final double dashSpacing;
  final double? height;
  final double? width;
  final double indent;
  final double endIndent;

  const AppDivider({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.thickness = 1.5,
    this.dashLength = 3.0,
    this.dashSpacing = 5.0,
    this.endIndent = 0.0,
    this.indent = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(left: indent, right: endIndent),
      child: CustomPaint(
        painter: _AppDividerPainter(
          color: color ?? (isDark ? Colors.white : Colors.black),
          thickness: thickness,
          dashLength: dashLength,
          dashSpacing: dashSpacing,
        ),
        child: Container(
          height: height ?? thickness,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

class _AppDividerPainter extends CustomPainter {
  final Color color;
  final double thickness;
  final double dashLength;
  final double dashSpacing;

  _AppDividerPainter({
    required this.color,
    required this.thickness,
    required this.dashLength,
    required this.dashSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    final dashCount = (size.width / (dashLength + dashSpacing)).floor();

    final dashPath = Path();
    for (var i = 0; i < dashCount; i++) {
      final startX = i * (dashLength + dashSpacing);
      final endX = startX + dashLength;
      final startY = size.height / 2;
      final endY = startY;

      dashPath.moveTo(startX, startY);
      dashPath.lineTo(endX, endY);
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRebuildSemantics(_AppDividerPainter oldDelegate) => true;

  @override
  bool shouldRepaint(_AppDividerPainter oldDelegate) => true;
}
