import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/config/router/app_router.gr.dart';
import 'package:pureair_v2/application/auth_bloc/auth_bloc.dart';
import 'package:pureair_v2/constants/constants.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('SPLASH PAGE'),
            // CircularProgressIndicator(),
            20.verticalSpace,
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.logoutPressed());
              },
              child: const Text('Logout'),
            ),
            20.verticalSpace,
            ElevatedButton(
              onPressed: () {
                context.router.push(const RegisterRoute());
              },
              child: const Text('Go to the next next page'),
            ),
          ],
        ),
      ),
    );
  }
}
