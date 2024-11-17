import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pureair_v2/app/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed(R.login),
              child: const Text('Go to Login Page'),
            ),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed(R.register),
              child: const Text('Go to Register Page'),
            ),
          ],
        ),
      ),
    );
  }
}
