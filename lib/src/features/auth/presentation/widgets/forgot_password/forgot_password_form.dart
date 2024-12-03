import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class ForgotPasswordForm extends HookConsumerWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

class _EmailAddressWidget extends ConsumerWidget {
  const _EmailAddressWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(emailAddressNotifierProvider.notifier);
    return PTextFormField(
      labelText: 'Email Address',
      hintText: 'john@example.com',
      onChanged: notifier.onChanged,
      validator: notifier.validator,
      keyboardType: TextInputType.emailAddress,
      enabled: ref.watch(forgotPasswordNotifierProvider)
          is! SendingPasswordResetEmail,
    );
  }
}

class _SubmitButton extends ConsumerWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> sendPasswordResetEmail() async {
      if (Form.of(context).validate()) {
        return ref
            .read(forgotPasswordNotifierProvider.notifier)
            .sendPasswordResetEmail();
      }
    }

    return PrimaryButton(
      title: 'Submit',
      loading: ref.watch(forgotPasswordNotifierProvider)
          is SendingPasswordResetEmail,
      onPressed: sendPasswordResetEmail,
    );
  }
}
