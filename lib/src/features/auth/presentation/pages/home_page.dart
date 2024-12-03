import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/features/auth/application/application.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, ${user?.fullName.getOrCrash}'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: ref.read(authNotifierProvider.notifier).signOut,
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
