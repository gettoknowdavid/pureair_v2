import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PDivider extends StatelessWidget {
  const PDivider({
    super.key,
    this.height,
    this.width,
    this.color,
    this.thickness = 1.5,
    this.dashLength = 3.0,
    this.dashSpacing = 5.0,
    this.endIndent = 0.0,
    this.indent = 0.0,
  });

  final Color? color;
  final double? height;
  final double? width;
  final double thickness;
  final double dashLength;
  final double dashSpacing;
  final double endIndent;
  final double indent;

  @override
  Widget build(BuildContext context) {
    return Skeleton.ignore(
      child: Padding(
        padding: EdgeInsets.only(left: indent, right: endIndent),
        child: CustomPaint(
          painter: _DividerPainter(
            color: color ?? Theme.of(context).colorScheme.onSurface,
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
      ),
    );
  }
}

class _DividerPainter extends CustomPainter {
  _DividerPainter({
    required this.color,
    required this.thickness,
    required this.dashLength,
    required this.dashSpacing,
  });
  final Color color;
  final double thickness;
  final double dashLength;
  final double dashSpacing;

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

      dashPath
        ..moveTo(startX, startY)
        ..lineTo(endX, endY);
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRebuildSemantics(_DividerPainter oldDelegate) => true;

  @override
  bool shouldRepaint(_DividerPainter oldDelegate) => true;
}
