import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/constants/constants.dart';

import '../../../../common/common.dart';
import '../../../../router/router.dart';
import '../../application/application.dart';
import '../../domain/domain.dart';

@RoutePage(deferredLoading: true)
class ForgotPasswordPage extends StatelessWidget {
  final bool emailSent;
  const ForgotPasswordPage({super.key, this.emailSent = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final cubit = context.watch<ForgotPasswordCubit>();

    if (emailSent) {
      return _ConfirmationPage();
    }

    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      bloc: cubit,
      listenWhen: (previous, current) => previous.option != current.option,
      listener: (context, state) {
        state.option.fold(
          () => null,
          (either) => either.fold(
            (failure) => _showFailureMessage(failure, context),
            (success) => context.router.replaceAll(
              [ForgotPasswordRoute(emailSent: true)],
            ),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(leading: const AppBackButton()),
        body: ListView(
          padding: const EdgeInsets.all(kGlobalPadding),
          shrinkWrap: true,
          children: [
            4.verticalSpace,
            Text(
              'Forgot your password?',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            4.verticalSpace,
            Text(
              'It happens. All you need to do is type in your email address and we will send a quick fix.',
              style: textTheme.bodyLarge?.copyWith(
                letterSpacing: 0,
                color: colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            40.verticalSpace,
            _Email(),
            30.verticalSpace,
            _SubmitButton(),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }

  void _showFailureMessage(AuthFailure failure, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(ErrorSnackbar(
      theme: Theme.of(context),
      content: SnackbarContent(failure.mapOrNull(
        serverError: (_) => kServerError,
        invalidEmail: (_) => kInvalidEmail,
        userNotFound: (_) => kUserNotFound,
        noNetworkConnection: (_) => kNoNetworkConnection,
      )),
    ));
  }
}

class _ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kGlobalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Text(
              'You have mail!',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            4.verticalSpace,
            Text(
              "We've sent your password reset link to your email. Reset your password and when you're ready, login to your account.",
              style: textTheme.bodyLarge?.copyWith(
                letterSpacing: 0,
                color: colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            40.verticalSpace,
            _GoToLoginButton(),
            60.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ForgotPasswordCubit>();
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      bloc: cubit,
      buildWhen: (p, c) => p.email != c.email,
      builder: (context, state) => AppTextField(
        key: const Key(AppKeys.forgotPasswordEmailInput),
        keyboardType: TextInputType.emailAddress,
        enabled: !cubit.state.loading,
        onChanged: cubit.emailChanged,
        label: 'Email address',
        hint: 'Your Email',
        isFieldValid: cubit.state.email.isValid(),
        validator: (_) => cubit.state.email.value.fold(
          (f) => f.mapOrNull(invalidEmail: (_) => kInvalidEmail),
          (r) => null,
        ),
      ),
    );
  }
}

class _GoToLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      key: const Key(AppKeys.backToLoginFromForgotPasswordButton),
      onPressed: () => context.router.replaceAll([const LayoutRoute()]),
      title: 'Go back to login',
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) => PrimaryButton(
        key: const Key(AppKeys.forgotPasswordButton),
        onPressed: cubit.submitPressed,
        loading: cubit.state.loading,
        disabled: !cubit.state.email.isValid(),
        title: 'Submit email',
      ),
    );
  }
}
