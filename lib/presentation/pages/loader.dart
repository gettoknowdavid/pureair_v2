import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animations/lottie-loader.json',
      animate: true,
    );
  }
}
