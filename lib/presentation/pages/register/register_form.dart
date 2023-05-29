import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/config/router/app_router.gr.dart';
import 'package:pureair_v2/application/auth_bloc/auth_bloc.dart';
import 'package:pureair_v2/application/register_cubit/register_cubit.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/loading.dart';

import 'password_rules.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final cubit = context.watch<RegisterCubit>();
    final authBloc = context.read<AuthBloc>();

    return BlocListener<RegisterCubit, RegisterState>(
      bloc: cubit,
      listenWhen: (previous, current) => previous.option != current.option,
      listener: (context, state) {
        cubit.state.option.fold(
          () => null,
          (either) => either.fold(
            (failure) => scaffoldMessenger.showSnackBar(SnackBar(
              backgroundColor: theme.colorScheme.errorContainer,
              content: Text(
                failure.maybeMap(
                  orElse: () => '',
                  serverError: (_) => kServerError,
                  emailInUse: (_) => kEmailInUse,
                  noNetworkConnection: (_) => kNoNetworkConnection,
                ),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            )),
            (success) {
              authBloc.add(const AuthEvent.verificationMailSent());
              context.router.replace(const LayoutRoute());
              authBloc.add(const AuthEvent.verificationChecked());
            },
          ),
        );
      },
      child: Form(
        child: Column(
          children: [
            _Name(),
            10.verticalSpace,
            _Email(),
            10.verticalSpace,
            _Password(),
            6.verticalSpace,
            const PasswordRules(),
            20.verticalSpace,
            _RegisterButton(),
          ],
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameValidator = context.select(
      (RegisterCubit cubit) => cubit.state.name.value.fold(
        (f) => f.mapOrNull(empty: (_) => kEmpty),
        (r) => null,
      ),
    );

    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (p, c) => p.name != c.name,
      builder: (context, state) {
        return TextFormField(
          key: const Key(AppKeys.registerNameInput),
          onChanged: context.read<RegisterCubit>().nameChanged,
          validator: (_) => nameValidator,
          decoration: const InputDecoration(
            labelText: 'Name',
          ),
        );
      },
    );
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailValidator = context.select(
      (RegisterCubit cubit) => cubit.state.email.value.fold(
        (f) => f.mapOrNull(invalidEmail: (_) => kInvalidEmail),
        (r) => null,
      ),
    );

    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (p, c) => p.email != c.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key(AppKeys.registerEmailInput),
          keyboardType: TextInputType.emailAddress,
          onChanged: context.read<RegisterCubit>().emailChanged,
          validator: (_) => emailValidator,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return ElevatedButton(
          key: const Key(AppKeys.registerButton),
          onPressed: cubit.isDisabled ? null : cubit.registerPressed,
          child: cubit.state.loading ? const Loading() : const Text('Register'),
        );
      },
    );
  }
}

class _Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final passwordValidator = context.select(
      (RegisterCubit cubit) => cubit.state.email.value.fold(
        (f) => f.mapOrNull(invalidPassword: (_) => kInvalidPassword),
        (r) => null,
      ),
    );

    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (p, c) => p.password != c.password,
      builder: (context, state) {
        return TextFormField(
          key: const Key(AppKeys.registerPasswordInput),
          obscureText: true,
          onChanged: context.read<RegisterCubit>().passwordChanged,
          validator: (_) => passwordValidator,
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
        );
      },
    );
  }
}
