import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PContainer extends HookWidget {
  const PContainer({
    this.duration = const Duration(milliseconds: 500),
    this.highlightColor = const Color.fromARGB(255, 94, 94, 94),
    this.loading = false,
    this.disabled = false,
    this.thickness = 2.0,
    this.height,
    this.width,
    this.borderColor,
    this.backgroundColor,
    this.boxShadow,
    this.margin,
    this.padding,
    this.alignment,
    this.child,
    super.key,
  });

  final Color highlightColor;
  final Duration duration;
  final bool loading;
  final bool disabled;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? backgroundColor;
  final double thickness;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Alignment? alignment;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final animationController = useAnimationController(duration: duration)
      ..repeat(reverse: true);

    final animation = ColorTween(
      begin: borderColor,
      end: highlightColor,
    ).animate(animationController);
    final colorAnimation = useAnimation<Color?>(animation);

    final borderColorToUse =
        loading ? colorAnimation : (borderColor ?? colors.onSurface);

    return Container(
      margin: margin,
      decoration: BoxDecoration(boxShadow: boxShadow),
      child: CustomPaint(
        isComplex: true,
        foregroundPainter: _BorderPainter(
          color: disabled ? Colors.transparent : borderColorToUse,
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
  _BorderPainter({required this.thickness, this.color});
  final double thickness;
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? const Color.fromARGB(255, 94, 94, 94)
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRebuildSemantics(_BorderPainter oldDelegate) => false;

  @override
  bool shouldRepaint(_BorderPainter oldDelegate) {
    return color != oldDelegate.color || thickness != oldDelegate.thickness;
  }
}
