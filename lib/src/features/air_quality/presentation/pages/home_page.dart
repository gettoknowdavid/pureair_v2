import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/constants/constants.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator.adaptive(
      onRefresh: () => ref.refresh(localAirQualityProvider.future),
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
              // const AirQualityList(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
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
