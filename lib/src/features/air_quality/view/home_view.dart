import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/constants/constants.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () => Future.wait([
        context.read<LocalizedBloc>().stream.first,
        context.read<CitiesBloc>().stream.first,
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

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
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
