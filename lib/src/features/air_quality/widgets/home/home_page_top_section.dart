import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart' show AuthBloc;
import 'package:pureair_v2/src/router/routing.dart';
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
            AddCityButton(onPressed: () => const AddCityRoute().push(context)),
          ],
        ),
        const SizedBox(height: 4),
        Text(today, style: PureAirTextTheme.of(context)!.caption),
      ],
    );
  }
}

class _NameWidget extends StatelessWidget {
  const _NameWidget();

  @override
  Widget build(BuildContext context) {
    final style = PureAirTextTheme.of(context)?.titleBold;

    final fullName = context.select((AuthBloc b) => b.state.user.fullName);
    final firstName = fullName.getOrCrash.split(' ')[0];
    final helloText = firstName.isEmpty ? 'Hello there!' : 'Hello $firstName';

    return Text(helloText, style: style);
  }
}
