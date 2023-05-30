import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/config/router/router.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/errors/errors.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

import 'password_rules.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RegisterCubit>();
    final authBloc = context.read<AuthBloc>();

    return BlocListener<RegisterCubit, RegisterState>(
      bloc: cubit,
      listenWhen: (previous, current) => previous.option != current.option,
      listener: (context, state) {
        state.option.fold(
          () => null,
          (either) => either.fold(
            (failure) => _showFailureMessage(context, failure),
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

  void _showFailureMessage(BuildContext context, AuthError failure) {
    ScaffoldMessenger.of(context).showSnackBar(AppSnackbar(
      theme: Theme.of(context),
      content: SnackbarContent(failure.mapOrNull(
        serverError: (_) => kServerError,
        emailInUse: (_) => kEmailInUse,
        noNetworkConnection: (_) => kNoNetworkConnection,
      )),
    ));
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
