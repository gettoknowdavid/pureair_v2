import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/app/router/router.gr.dart';
import 'package:pureair_v2/constants/constants.dart';

import '../../../application/auth_bloc/auth_bloc.dart';

@RoutePage(deferredLoading: true)
class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<AuthBloc>();

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kGlobalPadding),
        child: BlocConsumer<AuthBloc, AuthState>(
          bloc: bloc,
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            bloc.state.whenOrNull(
              unauthenticated: () => debugPrint('unauthenticated'),
              verified: () {
                AutoRouter.of(context).replaceAll([const LayoutRoute()]);
              },
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                Text('Verification', style: theme.textTheme.displaySmall),
                10.verticalSpace,
                Text(
                  'A verification email has been sent to your email address.',
                  style: theme.textTheme.bodyLarge,
                ),
                30.verticalSpace,
                ElevatedButton(
                  onPressed: () {
                    bloc.add(const AuthEvent.verificationChecked());
                  },
                  child: const Text('Verify'),
                ),
                10.verticalSpace,
                OutlinedButton(
                    onPressed: () {}, child: const Text('Open Mail')),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        bloc.add(const AuthEvent.logoutPressed());
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        bloc.add(const AuthEvent.verificationMailSent());
                      },
                      child: const Text('Resend'),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
