import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/constants/constants.dart';

import '../../application/application.dart';

class PasswordRules extends StatelessWidget {
  const PasswordRules({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PasswordCubit>();

    return BlocBuilder<PasswordCubit, PasswordState>(
      bloc: cubit,
      builder: (context, state) {
        final length = cubit.state.rules.length;
        final isPasswordEmpty =
            context.watch<RegisterFormCubit>().isPasswordEmpty;

        return Visibility(
          visible: isPasswordEmpty == false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < length; i++) ...[
                _Chip(rule: cubit.state.rules[i]),
              ]
            ],
          ),
        );
      },
    );
  }
}

class _Chip extends StatelessWidget {
  final Map<dynamic, dynamic> rule;
  const _Chip({required this.rule});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.labelLarge;
    final isDarkTheme = theme.brightness == Brightness.dark;

    // Sum of global padding on left and right and additional Wrap padding: 20+20+8+8
    const globalPadding = 56.0;

    // Width of the wrap spacing
    const passwordRulesWrapSpacing = 10.0;

    final cubit = context.watch<RegisterFormCubit>();

    final password = cubit.state.passwordController?.text;

    final label = rule["name"].toString();

    final isActive = password == null ? false : rule["rule"](password);

    final unsetColor = !isDarkTheme ? Colors.black38 : Colors.white38;

    Color ruleColor = isActive ? Colors.green : unsetColor;

    return SizedBox(
      width: (size.width - (globalPadding + passwordRulesWrapSpacing)) / 2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(
            PhosphorIcons.duotone.checkCircle,
            size: textStyle?.fontSize,
            color: isActive ? Colors.black : unsetColor,
            duotoneSecondaryColor: ruleColor,
            duotoneSecondaryOpacity: isActive ? 1 : 0.1,
          ),
          4.horizontalSpace,
          Text(label, style: textStyle?.copyWith(color: ruleColor))
        ],
      ),
    );
  }
}
