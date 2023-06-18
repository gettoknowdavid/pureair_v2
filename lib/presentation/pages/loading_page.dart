import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'loader.dart';

@RoutePage(deferredLoading: true)
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Loader(),
      ),
    );
  }
}
