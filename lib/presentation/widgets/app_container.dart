import 'package:flutter/material.dart';

class AppContainer extends StatefulWidget {
  final Color? borderColor;
  final Color? highlightColor;
  final Color? backgroundColor;
  final double thickness;
  final double? height;
  final double? width;
  final List<BoxShadow>? boxShadow;
  final bool disabled;
  final Duration duration;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Alignment? alignment;
  final bool loading;

  const AppContainer({
    super.key,
    this.borderColor,
    this.highlightColor = const Color.fromARGB(255, 94, 94, 94),
    this.backgroundColor,
    this.thickness = 2.0,
    this.height,
    this.width,
    this.boxShadow,
    this.disabled = false,
    this.duration = const Duration(milliseconds: 1000),
    this.loading = false,
    this.child,
    this.margin,
    this.padding,
    this.alignment,
  });

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(
      begin: widget.borderColor,
      end: widget.highlightColor,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (!widget.loading) {
      return Container(
        margin: widget.margin,
        decoration: BoxDecoration(boxShadow: widget.boxShadow),
        child: CustomPaint(
          isComplex: true,
          foregroundPainter: _BorderPainter(
            color: widget.disabled
                ? Colors.transparent
                : widget.borderColor ?? colorScheme.onBackground,
            thickness: widget.thickness,
          ),
          child: Container(
            height: widget.height,
            width: widget.width,
            alignment: widget.alignment,
            color: widget.backgroundColor,
            padding: widget.padding,
            child: widget.child,
          ),
        ),
      );
    } else {
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            margin: widget.margin,
            decoration: BoxDecoration(boxShadow: widget.boxShadow),
            child: CustomPaint(
              isComplex: true,
              foregroundPainter: _BorderPainter(
                color: _colorAnimation.value!,
                thickness: widget.thickness,
              ),
              child: Container(
                height: widget.height,
                width: widget.width,
                alignment: widget.alignment,
                color: widget.backgroundColor,
                padding: widget.padding,
                child: widget.child,
              ),
            ),
          );
        },
      );
    }
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
