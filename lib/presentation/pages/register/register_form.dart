import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/auth_bloc/auth_bloc.dart';
import 'package:pureair_v2/application/register_cubit/register_cubit.dart';
import 'package:pureair_v2/config/router/app_router.gr.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/app_button.dart';
import 'package:pureair_v2/presentation/widgets/app_text_field.dart';

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
            20.verticalSpace,
            _Email(),
            20.verticalSpace,
            _Password(),
            6.verticalSpace,
            const PasswordRules(),
            40.verticalSpace,
            _RegisterButton(),
          ],
        ),
      ),
    );
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<RegisterCubit>();

    final emailValidator = context.select(
      (RegisterCubit cubit) => cubit.state.email.value.fold(
        (f) => f.mapOrNull(invalidEmail: (_) => kInvalidEmail),
        (r) => null,
      ),
    );

    return BlocBuilder<RegisterCubit, RegisterState>(
      bloc: bloc,
      buildWhen: (p, c) => p.email != c.email,
      builder: (context, state) => AppTextField(
        key: const Key(AppKeys.registerEmailInput),
        keyboardType: TextInputType.emailAddress,
        enabled: !bloc.state.loading,
        onChanged: bloc.emailChanged,
        validator: (_) => emailValidator,
        label: 'Email address',
        hint: 'Your Email',
        isFieldValid: bloc.state.email.isValid(),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<RegisterCubit>();

    final nameValidator = context.select(
      (RegisterCubit cubit) => cubit.state.name.value.fold(
        (f) => f.mapOrNull(empty: (_) => kEmpty),
        (r) => null,
      ),
    );

    return BlocBuilder<RegisterCubit, RegisterState>(
      bloc: bloc,
      buildWhen: (p, c) => p.name != c.name,
      builder: (context, state) => AppTextField(
        key: const Key(AppKeys.registerNameInput),
        onChanged: bloc.nameChanged,
        enabled: !bloc.state.loading,
        validator: (_) => nameValidator,
        label: 'Name',
        hint: 'Your Name',
        isFieldValid: bloc.state.name.isValid(),
      ),
    );
  }
}

class _Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<RegisterCubit>();

    final passwordValidator = context.select(
      (RegisterCubit cubit) => cubit.state.email.value.fold(
        (f) => f.mapOrNull(invalidPassword: (_) => kInvalidPassword),
        (r) => null,
      ),
    );

    return BlocBuilder<RegisterCubit, RegisterState>(
      bloc: bloc,
      buildWhen: (p, c) => p.password != c.password,
      builder: (context, state) => AppTextField(
        key: const Key(AppKeys.registerPasswordInput),
        isPassword: true,
        onChanged: bloc.passwordChanged,
        enabled: !bloc.state.loading,
        validator: (_) => passwordValidator,
        textInputAction: TextInputAction.go,
        label: 'Password',
        hint: 'Your Password',
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return PrimaryButton(
          key: const Key(AppKeys.registerButton),
          onPressed: cubit.registerPressed,
          disabled: cubit.isDisabled,
          loading: cubit.state.loading,
          title: 'Create account',
        );
      },
    );
  }
}
