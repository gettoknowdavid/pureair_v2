import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoginCubit>();

    return BlocListener<LoginCubit, LoginState>(
      bloc: cubit,
      listenWhen: (previous, current) => previous.option != current.option,
      listener: (context, state) {
        state.option.fold(
          () => null,
          (either) => either.fold(
            (failure) => _showFailureMessage(failure, context),
            (success) {
              cubit.dispose();
              context.router.replaceAll([const LayoutRoute()]);
            },
          ),
        );
      },
      child: Form(
        child: Column(
          children: [
            _Email(),
            20.verticalSpace,
            _Password(),
            20.verticalSpace,
            const _ForgotPassword(),
            40.verticalSpace,
            _LoginButton(),
          ],
        ),
      ),
    );
  }

  void _showFailureMessage(AuthError failure, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(AppSnackbar(
      theme: Theme.of(context),
      content: SnackbarContent(failure.mapOrNull(
        error: (value) => value.message,
        serverError: (_) => kServerError,
        invalidEmailOrPassword: (_) => kInvalidEmailOrPassword,
        noNetworkConnection: (_) => kNoNetworkConnection,
      )),
    ));
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoginCubit>();

    final emailValidator = context.select<LoginCubit, String?>(
      (selector) => selector.state.email.value.fold(
        (f) => f.mapOrNull(invalidEmail: (_) => kInvalidEmail),
        (r) => null,
      ),
    );

    return BlocBuilder<LoginCubit, LoginState>(
      bloc: cubit,
      buildWhen: (p, c) => p.email != c.email,
      builder: (context, state) => AppTextField(
        key: const Key(AppKeys.loginEmailInput),
        keyboardType: TextInputType.emailAddress,
        onChanged: cubit.emailChanged,
        validator: (_) => emailValidator,
        enabled: !cubit.state.loading || !cubit.state.googleSignInLoading,
        label: 'Email address',
        hint: 'example@gmail.com',
        isFieldValid: cubit.state.email.isValid(),
      ),
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => context.router.push(ForgotPasswordRoute()),
        child: Text(
          'Forgot Password?',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return PrimaryButton(
          key: const Key(AppKeys.loginButton),
          onPressed: cubit.loginPressed,
          loading: cubit.state.loading,
          disabled: cubit.isDisabled,
          title: 'Login to my account',
        );
      },
    );
  }
}

class _Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoginCubit>();

    final passwordValidator = context.select<LoginCubit, String?>(
      (selector) => selector.state.email.value.fold(
        (f) => f.mapOrNull(invalidPassword: (_) => kInvalidPassword),
        (r) => null,
      ),
    );

    return BlocBuilder<LoginCubit, LoginState>(
      bloc: cubit,
      buildWhen: (p, c) => p.password != c.password,
      builder: (context, state) => AppTextField(
        key: const Key(AppKeys.loginPasswordInput),
        isPassword: true,
        onChanged: cubit.passwordChanged,
        validator: (_) => passwordValidator,
        enabled: !cubit.state.loading || !cubit.state.googleSignInLoading,
        label: 'Password',
        hint: 'Your password',
      ),
    );
  }
}
