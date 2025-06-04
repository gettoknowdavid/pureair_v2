import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class SignUpForm extends HookWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _FullNameWidget(),
          SizedBox(height: 24),
          _EmailAddressWidget(),
          SizedBox(height: 24),
          _PasswordWidget(),
          SizedBox(height: 40),
          _SignUpButton(),
        ],
      ),
    );
  }
}

class _FullNameWidget extends StatelessWidget {
  const _FullNameWidget();

  @override
  Widget build(BuildContext context) {
    final fullName = context.select((SignUpCubit bloc) => bloc.state.fullName);
    final status = context.select((SignUpCubit bloc) => bloc.state.status);
    return PTextFormField(
      labelText: 'Full Name',
      hintText: 'John Doe',
      enabled: status != SignUpStatus.inProgress,
      onChanged: context.read<SignUpCubit>().emailChanged,
      validator: (_) => fullName.failureOrNull?.message,
    );
  }
}

class _EmailAddressWidget extends StatelessWidget {
  const _EmailAddressWidget();

  @override
  Widget build(BuildContext context) {
    final email = context.select((SignUpCubit bloc) => bloc.state.email);
    final status = context.select((SignUpCubit bloc) => bloc.state.status);
    return PTextFormField(
      labelText: 'Email Address',
      hintText: 'john@example.com',
      enabled: status != SignUpStatus.inProgress,
      onChanged: context.read<SignUpCubit>().emailChanged,
      validator: (_) => email.failureOrNull?.message,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget();

  @override
  Widget build(BuildContext context) {
    final password = context.select((SignUpCubit bloc) => bloc.state.password);
    final status = context.select((SignUpCubit bloc) => bloc.state.status);
    return PTextFormField(
      labelText: 'Password',
      hintText: 'Your password',
      isPassword: true,
      enabled: status != SignUpStatus.inProgress,
      onChanged: context.read<SignUpCubit>().passwordChanged,
      validator: (_) => password.failureOrNull?.message,
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    final isFormValid = context.select((SignUpCubit b) => b.state.isValid);
    final status = context.select((SignUpCubit b) => b.state.status);

    Future<void> signUp() async {
      if (Form.of(context).validate()) {
        return context.read<SignUpCubit>().signUp();
      }
    }

    return PrimaryButton(
      title: 'Sign Up',
      loading: status == SignUpStatus.inProgress,
      disabled: status == SignUpStatus.inProgress || !isFormValid,
      onPressed: signUp,
    );
  }
}
