import 'package:flutter/material.dart';

class SkeletonLoader extends StatefulWidget {
  final Widget child;
  final bool loading;
  final Color baseColor;
  final Color highlightColor;
  final Duration animationDuration;

  const SkeletonLoader({
    super.key,
    required this.child,
    this.loading = true,
    this.baseColor = const Color.fromARGB(255, 65, 65, 65),
    this.highlightColor = Colors.white,
    this.animationDuration = const Duration(milliseconds: 1000),
  });

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  Widget build(BuildContext context) {
    if (!widget.loading) {
      return widget.child;
    }

    

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: _colorAnimation.value!,
              width: 2,
            ),
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(
      begin: widget.baseColor,
      end: widget.highlightColor,
    ).animate(_animationController);
  }
}
