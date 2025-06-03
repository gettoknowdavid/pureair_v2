import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/core/theme/theme.dart';

class PTextFormField extends FormField<String> {
  PTextFormField({
    required this.labelText,
    this.hintText,
    super.initialValue,
    super.autovalidateMode,
    super.enabled = true,
    super.validator,
    this.icon,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
    this.isPassword = false,
    this.onChanged,
    this.height,
    this.onTap,
    this.required = false,
    super.key,
  }) : super(
          builder: (field) {
            void onChangedHandler(String value) {
              field.didChange(value);
              onChanged?.call(value);
            }

            return _FieldWidget(
              hasError: field.hasError,
              errorText: field.errorText,
              required: required,
              isEmpty: field.value == null,
              labelText: labelText,
              icon: icon,
              hintText: hintText,
              initialValue: initialValue,
              focusNode: focusNode,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              autofocus: autofocus,
              enabled: enabled,
              isPassword: isPassword,
              onChanged: onChangedHandler,
              height: height,
              onTap: onTap,
            );
          },
        );

  final String labelText;
  final String? hintText;
  final IconData? icon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool isPassword;
  final void Function(String)? onChanged;
  final double? height;
  final VoidCallback? onTap;
  final bool required;

  @override
  _PTextFormFieldState createState() => _PTextFormFieldState();
}

class _PTextFormFieldState extends FormFieldState<String> {
  @override
  PTextFormField get widget => super.widget as PTextFormField;
}

class _FieldWidget extends HookWidget {
  const _FieldWidget({
    required this.hasError,
    required this.errorText,
    required this.enabled,
    required this.isPassword,
    required this.autofocus,
    required this.labelText,
    required this.isEmpty,
    this.icon,
    this.hintText,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.height,
    this.onTap,
    this.required = false,
  });

  final String labelText;
  final bool hasError;
  final String? errorText;
  final String? initialValue;
  final IconData? icon;
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool isPassword;
  final bool enabled;
  final void Function(String)? onChanged;
  final double? height;
  final VoidCallback? onTap;
  final bool required;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    final obscure = useState<bool>(isPassword);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = PureAirTextTheme.of(context)!;
    final labelStyle = theme.inputDecorationTheme.labelStyle;

    final validityIcon = _ValidityIcon(hasError: hasError, isEmpty: isEmpty);

    Widget? suffixIcon;

    if (isPassword) {
      final validitySpacer =
          isEmpty ? const SizedBox.shrink() : const SizedBox(width: 12);

      suffixIcon = Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _EyeIcon(obscure: obscure),
          validitySpacer,
          validityIcon,
          validitySpacer,
        ],
      );
    } else {
      suffixIcon = validityIcon;
    }

    return TextFormField(
      focusNode: focusNode,
      keyboardType: keyboardType,
      initialValue: initialValue,
      textInputAction: textInputAction,
      autofocus: autofocus,
      enabled: enabled,
      onChanged: onChanged,
      obscureText: obscure.value,
      onTap: onTap,
      style: textTheme.body?.copyWith(fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        labelText: labelText,
        labelStyle: labelStyle?.copyWith(fontWeight: FontWeight.w700),
        suffixIconColor: hasError ? colors.error : colors.onSurface,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

class _EyeIcon extends StatelessWidget {
  const _EyeIcon({required this.obscure});
  final ValueNotifier<bool> obscure;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      attributedLabel: AttributedString('Hide Password'),
      child: IconButton(
        onPressed: () => obscure.value = !obscure.value,
        icon: Icon(
          obscure.value ? PhosphorIconsBold.eye : PhosphorIconsBold.eyeSlash,
          size: 22,
        ),
      ),
    );
  }
}

class _ValidityIcon extends StatelessWidget {
  const _ValidityIcon({required this.hasError, required this.isEmpty});
  final bool hasError;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (isEmpty) return const SizedBox.shrink();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 22, maxWidth: 22),
      child: Center(
        child: Container(
          height: 22,
          width: 22,
          decoration: BoxDecoration(
            color: hasError ? colors.error : colors.tertiary,
            shape: BoxShape.circle,
            border: Border.all(color: colors.onSurface, width: 2),
          ),
          child: PhosphorIcon(
            hasError
                ? PhosphorIconsBold.exclamationMark
                : PhosphorIconsBold.check,
            color: hasError ? colors.onError : colors.onTertiary,
            size: 14,
          ),
        ),
      ),
    );
  }
}
