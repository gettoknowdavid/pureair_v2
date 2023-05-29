import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final double? height;
  final double? width;
  const Loading({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? 20.0,
        width: width ?? 20.0,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
