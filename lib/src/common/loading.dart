import 'package:flutter/material.dart';
import 'package:pureair_v2/src/common/loader.dart';

class Loading extends StatelessWidget {
  final double? height;
  final double? width;
  const Loading({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: const Loader(),
      ),
    );
  }
}
