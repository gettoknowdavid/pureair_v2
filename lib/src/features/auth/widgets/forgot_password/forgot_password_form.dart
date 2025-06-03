import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class ForgotPasswordForm extends HookWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

    return Form(
      key: formKey,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _EmailAddressWidget(),
          SizedBox(height: 30),
          _SubmitButton(),
        ],
      ),
    );
  }
}

class _EmailAddressWidget extends StatelessWidget {
  const _EmailAddressWidget();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ForgotPasswordCubit>();
    return PTextFormField(
      labelText: 'Email Address',
      hintText: 'john@example.com',
      onChanged: bloc.emailChanged,
      validator: (_) => bloc.state.email.failureOrNull?.message,
      keyboardType: TextInputType.emailAddress,
      enabled: bloc.state.status != ForgotPasswordStatus.emailSendInProgress,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ForgotPasswordCubit>();

    Future<void> sendPasswordResetEmail() async {
      if (Form.of(context).validate()) return bloc.sendPasswordResetEmail();
    }

    return PrimaryButton(
      title: 'Submit',
      loading: bloc.state.status == ForgotPasswordStatus.emailSendInProgress,
      onPressed: sendPasswordResetEmail,
    );
  }
}
