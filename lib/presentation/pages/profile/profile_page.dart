import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/constants/app_sizes.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('PROFILE PAGE'),
            20.verticalSpace,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () =>
                  context.read<AuthBloc>().add(const AuthEvent.logoutPressed()),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
