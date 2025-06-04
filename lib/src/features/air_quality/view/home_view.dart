import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/core/constants/constants.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/router/routing.dart';

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
  Widget build(BuildContext ctx) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => switch (state.status) {
        AuthStatus.unauthenticated => const SignInRoute().go(context),
        _ => null,
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: Center(
          child: FilledButton(
            onPressed: () =>
                ctx.read<AuthBloc>().add(const AuthSignOutPressed()),
            child: const Text('Sign Out'),
          ),
        ),
      ),
    );
  }
}
