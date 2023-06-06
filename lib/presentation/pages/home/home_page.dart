import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

import 'widgets/air_quality_card.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: kHorizontalPadding18,
        child: Column(
          children: [
            12.verticalSpace,
            const _TopSection(),
            20.verticalSpace,
            Hero(
              tag: AppKeys.airQualityCard,
              child: Material(
                child: AirQualityCard(
                  onTap: () => context.router.push(const DetailsRoute()),
                ),
              ),
            ),
            20.verticalSpace,
            const AirQualityCard(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class _TopSection extends StatelessWidget {
  const _TopSection();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocSelector<AuthBloc, AuthState, String?>(
              selector: (state) => state.mapOrNull(
                authenticated: (value) => value.user.name?.get(),
              ),
              builder: (context, state) => Text(
                'Hello David',
                style: textTheme.titleLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            LimitedBox(
              maxHeight: 30,
              child: AddButton(title: 'Add', onPressed: () {}),
            ),
          ],
        ),
        4.verticalSpace,
        Text(
          '23 November 2022',
          style: textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
