import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/constants/constants.dart';

@RoutePage()
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('LAYOUT'),
            20.verticalSpace,
            ElevatedButton(
              onPressed: () {
                context.read<LoginCubit>().dispose();
                context.read<AuthBloc>().add(const AuthEvent.logoutPressed());
              },
              child: const Text('Logout'),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
