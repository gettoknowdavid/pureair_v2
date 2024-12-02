import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';

class RegisterForm extends HookWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FullNameWidget(),
          SizedBox(height: 24),
          EmailAddressWidget(),
          SizedBox(height: 24),
          PasswordWidget(),
          SizedBox(height: 40),
          RegisterButton(),
        ],
      ),
    );
  }
}
