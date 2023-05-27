import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/loading.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.option.fold(
          () => null,
          (either) => either.fold(
            (failure) => scaffoldMessenger.showSnackBar(SnackBar(
              backgroundColor: theme.colorScheme.errorContainer,
              content: Text(
                failure.maybeMap(
                  orElse: () => '',
                  serverError: (_) => kServerError,
                  invalidEmailOrPassword: (_) => kInvalidEmailOrPassword,
                  noNetworkConnection: (_) => kNoNetworkConnection,
                ),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            )),
            (success) {
              context.read<AuthBloc>().add(const AuthEvent.authChecked());
            },
          ),
        );
      },
      child: Form(
        child: Column(
          children: [
            _Email(),
            10.verticalSpace,
            _Password(),
            20.verticalSpace,
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailValidator = context.select(
      (LoginCubit cubit) => cubit.state.email.value.fold(
        (f) => f.mapOrNull(invalidEmail: (_) => kInvalidEmail),
        (r) => null,
      ),
    );

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (p, c) => p.email != c.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key(AppKeys.loginEmailInput),
          keyboardType: TextInputType.emailAddress,
          onChanged: context.read<LoginCubit>().emailChanged,
          validator: (_) => emailValidator,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          key: const Key(AppKeys.loginButton),
          onPressed: cubit.isDisabled ? null : cubit.loginPressed,
          child: cubit.state.loading ? const Loading() : const Text('Login'),
        );
      },
    );
  }
}

class _Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final passwordValidator = context.select(
      (LoginCubit cubit) => cubit.state.email.value.fold(
        (f) => f.mapOrNull(invalidPassword: (_) => kInvalidPassword),
        (r) => null,
      ),
    );

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (p, c) => p.password != c.password,
      builder: (context, state) {
        return TextFormField(
          key: const Key(AppKeys.loginPasswordInput),
          obscureText: true,
          onChanged: context.read<LoginCubit>().passwordChanged,
          validator: (_) => passwordValidator,
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
        );
      },
    );
  }
}
