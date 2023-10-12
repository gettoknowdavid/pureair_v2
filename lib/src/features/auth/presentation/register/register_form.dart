import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/constants/constants.dart';

import '../../../../common/common.dart';
import '../../../../router/router.dart';
import '../../application/application.dart';
import '../../domain/domain.dart';
import 'password_rules.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(context) {
    return BlocListener<RegisterFormCubit, RegisterFormState>(
      bloc: context.watch<RegisterFormCubit>(),
      listenWhen: (previous, current) => previous.option != current.option,
      listener: (context, state) {
        state.option.fold(
          () => null,
          (either) => either.fold(
            (failure) => _showFailureMessage(context, failure),
            (success) {
              context.read<AuthBloc>().add(const AuthEvent.authChecked());
              context.router.popAndPush(const VerificationRoute());
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

  void _showFailureMessage(BuildContext context, AuthFailure failure) {
    ScaffoldMessenger.of(context).showSnackBar(ErrorSnackbar(
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
  Widget build(context) {
    final cubit = context.watch<RegisterFormCubit>();
    return BlocBuilder<RegisterFormCubit, RegisterFormState>(
      buildWhen: (p, c) => p.email != c.email,
      builder: (context, email) => AppTextField(
        key: const Key(AppKeys.registerEmailInput),
        hint: 'Your Email',
        label: 'Email address',
        onChanged: cubit.emailChanged,
        enabled: !cubit.state.loading,
        isFieldValid: cubit.state.email.isValid(),
        keyboardType: TextInputType.emailAddress,
        validator: (_) => cubit.state.email.value.fold(
          (f) => f.mapOrNull(invalidEmail: (_) => kInvalidEmail),
          (r) => null,
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  @override
  Widget build(context) {
    final cubit = context.watch<RegisterFormCubit>();
    return BlocBuilder<RegisterFormCubit, RegisterFormState>(
      buildWhen: (p, c) => p.name != c.name,
      builder: (context, state) => AppTextField(
        key: const Key(AppKeys.registerNameInput),
        label: 'Name',
        hint: 'Your Name',
        isFieldValid: cubit.state.name.isValid() == true,
        onChanged: cubit.nameChanged,
        enabled: !context.watch<RegisterFormCubit>().state.loading,
        validator: (_) => cubit.state.name.value.fold(
          (f) => f.mapOrNull(empty: (_) => kEmpty),
          (r) => null,
        ),
      ),
    );
  }
}

class _Password extends StatelessWidget {
  @override
  Widget build(context) {
    final cubit = context.watch<RegisterFormCubit>();
    return BlocBuilder<RegisterFormCubit, RegisterFormState>(
      buildWhen: (p, c) => p.password != c.password,
      builder: (context, password) => AppTextField(
        key: const Key(AppKeys.registerPasswordInput),
        isPassword: true,
        label: 'Password',
        hint: 'Your Password',
        textInputAction: TextInputAction.go,
        isFieldValid: cubit.state.password.isValid(),
        onChanged: cubit.passwordChanged,
        enabled: !cubit.state.loading,
        validator: (_) => cubit.state.password.value.fold(
          (f) => f.mapOrNull(invalidPassword: (_) => kInvalidPassword),
          (r) => null,
        ),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RegisterFormCubit>();
    return BlocBuilder<RegisterFormCubit, RegisterFormState>(
      bloc: cubit,
      builder: (context, state) => PrimaryButton(
        key: const Key(AppKeys.registerButton),
        onPressed: cubit.registerPressed,
        disabled: cubit.isDisabled,
        loading: cubit.state.loading,
        title: 'Create account',
      ),
    );
  }
}
