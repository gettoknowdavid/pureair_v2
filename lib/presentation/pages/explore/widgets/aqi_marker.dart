import 'package:flutter/material.dart';
import 'package:pureair_v2/config/config.dart';

class AqiMarker extends StatelessWidget {
  final dynamic aqi;

  const AqiMarker({super.key, required this.aqi});

  @override
  Widget build(BuildContext context) {
    final value = int.tryParse(aqi);
    final color = value == null ? Colors.black : getAirQualityColor(value);

    return CustomPaint(
      size: const Size(18, 20),
      painter: _MapMarkerPainter(color, "$value"),
    );
  }
}

class _MapMarkerPainter extends CustomPainter {
  final Color color;
  final String text;

  _MapMarkerPainter(this.color, this.text);

  @override
  void paint(Canvas canvas, Size size) {
    final markerWidth = size.width;
    final markerHeight = size.height;
    const borderWidth = 2.0;
    const borderRadius = 0.0;
    const pointerWidth = 6.0;
    const pointerHeight = 4.0;

    final markerRect = Rect.fromLTRB(
      borderWidth / 2,
      borderWidth / 2,
      markerWidth - borderWidth / 2,
      markerHeight - borderWidth / 2 - pointerHeight,
    );

    final markerPaint = Paint()..color = color;
    final borderPaint = Paint()..color = Colors.black;

    final pointerPath = Path()
      ..moveTo((markerWidth - pointerWidth) / 2, markerHeight - pointerHeight)
      ..lineTo(markerWidth / 2, markerHeight)
      ..lineTo((markerWidth + pointerWidth) / 2, markerHeight - pointerHeight)
      ..close();

    canvas.drawRRect(
      RRect.fromRectAndRadius(markerRect, const Radius.circular(borderRadius)),
      borderPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(markerRect, const Radius.circular(borderRadius)),
      markerPaint,
    );

    canvas.drawPath(pointerPath, borderPaint);
    canvas.drawPath(pointerPath, markerPaint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final textX = (markerWidth - textPainter.width) / 2;
    final textY = markerHeight - pointerHeight - textPainter.height;
    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
