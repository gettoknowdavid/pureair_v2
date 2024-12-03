import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/features/auth/application/application.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: const HomeAppBar(),
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

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            UserAvatar(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class UserAvatar extends ConsumerWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final imageUrl = ref.watch(userProvider.select((value) => value?.imageUrl));
    return RawMaterialButton(
      onPressed: () {},
      elevation: 12,
      constraints: const BoxConstraints(
        maxHeight: 48,
        minHeight: 48,
        maxWidth: 48,
        minWidth: 48,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 4, color: colors.onPrimary),
      ),
      child: imageUrl == null
          ? const Icon(PhosphorIconsBold.user)
          : const SizedBox(),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore')),
    );
  }
}

class RanksPage extends StatelessWidget {
  const RanksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ranks')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
    );
  }
}
