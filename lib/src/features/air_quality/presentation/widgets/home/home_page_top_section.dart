import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/application/application.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class HomePageTopSection extends StatelessWidget {
  const HomePageTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final today = getDate();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _NameWidget(),
            AddCityButton(onPressed: () => context.push(R.addCity)),
          ],
        ),
        const SizedBox(height: 4),
        Text(today, style: PureAirTextTheme.of(context)!.caption),
      ],
    );
  }
}

class _NameWidget extends ConsumerWidget {
  const _NameWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = PureAirTextTheme.of(context)?.titleBold;

    final fullName = ref.watch(userProvider.select((value) => value?.fullName));
    final firstName = fullName?.getOrCrash.split(' ')[0];
    final helloText = firstName == null ? 'Hello there!' : 'Hello $firstName';

    return Text(helloText, style: style);
  }
}
