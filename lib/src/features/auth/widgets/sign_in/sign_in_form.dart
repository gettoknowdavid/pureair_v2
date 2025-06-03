import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class SignInForm extends HookWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _EmailAddressWidget(),
          SizedBox(height: 40),
          _PasswordWidget(),
          SizedBox(height: 30),
          ForgotPasswordButton(),
          SizedBox(height: 30),
          _SignInButton(),
        ],
      ),
    );
  }
}

class _EmailAddressWidget extends StatelessWidget {
  const _EmailAddressWidget();

  @override
  Widget build(BuildContext context) {
    final email = context.select((SignInCubit bloc) => bloc.state.email);
    final status = context.select((SignInCubit bloc) => bloc.state.status);
    return PTextFormField(
      labelText: 'Email Address',
      hintText: 'john@example.com',
      enabled: status == SignInStatus.inProgress,
      onChanged: context.read<SignInCubit>().emailChanged,
      validator: (_) => email.failureOrNull?.message,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget();

  @override
  Widget build(BuildContext context) {
    final password = context.select((SignInCubit bloc) => bloc.state.password);
    final status = context.select((SignInCubit bloc) => bloc.state.status);
    return PTextFormField(
      labelText: 'Password',
      hintText: 'Your password',
      isPassword: true,
      enabled: status == SignInStatus.inProgress,
      onChanged: context.read<SignInCubit>().passwordChanged,
      validator: (_) => password.failureOrNull?.message,
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    final isFormValid = context.select((SignInCubit b) => b.state.isValid);
    final status = context.select((SignInCubit b) => b.state.status);

    Future<void> signIn() async {
      if (Form.of(context).validate()) {
        return context.read<SignInCubit>().signIn();
      }
    }

    return PrimaryButton(
      title: 'Sign In',
      loading: status == SignInStatus.inProgress,
      disabled: status == SignInStatus.inProgress || isFormValid,
      onPressed: signIn,
    );
  }
}
