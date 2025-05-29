import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/constants/constants.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator.adaptive(
      onRefresh: () => Future.wait([
        ref.refresh(localAirQualityProvider.future),
        ref.refresh(citiesNotifierProvider.future),
      ]),
      child: const Scaffold(
        appBar: HomeAppBar(),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: kHorizontalPadding24,
          child: Column(
            children: [
              SizedBox(height: 12),
              HomePageTopSection(),
              SizedBox(height: 20),
              LocalAirQualityWidget(),
              SizedBox(height: 20),
              CitiesWidget(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: FilledButton(
          onPressed: () => ref.read(authFacadeProvider).signOut(),
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}
