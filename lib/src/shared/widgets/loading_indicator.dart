import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.height, this.width});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? 20,
        width: width ?? 20,
        child: const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
