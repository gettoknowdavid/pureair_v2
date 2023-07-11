import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppTextField extends StatefulWidget {
  final String hint;

  final bool isPassword;
  final String? label;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;
  final String? initialValue;
  final void Function()? onTap;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final bool autofocus;
  final TextInputAction textInputAction;
  final bool isFieldValid;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;

  const AppTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.label,
    this.keyboardType,
    this.autocorrect = false,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.initialValue,
    this.onTap,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.autofocus = true,
    this.textInputAction = TextInputAction.next,
    this.isFieldValid = false,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final mainStyle = theme.textTheme.titleMedium;

    final inputTheme = theme.inputDecorationTheme;

    final floatingLabelStyle = mainStyle?.copyWith(letterSpacing: 0);

    final hintStyle = inputTheme.hintStyle?.copyWith(letterSpacing: 0);

    final labelStyle = inputTheme.labelStyle?.copyWith(letterSpacing: 0);

    final style = mainStyle?.copyWith(fontWeight: FontWeight.bold);

    return TextFormField(
      key: widget.key,
      obscureText: widget.isPassword ? !obscure : obscure,
      onTap: widget.onTap,
      controller: widget.controller,
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      autocorrect: widget.autocorrect,
      onChanged: widget.onChanged,
      validator: widget.validator,
      enabled: widget.enabled,
      style: style,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      autofocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        labelStyle: labelStyle,
        fillColor: widget.fillColor,
        filled: widget.fillColor != null,
        floatingLabelStyle: floatingLabelStyle,
        hintStyle: hintStyle,
        suffixIcon: _suffixIcon(theme),
        prefixIcon: widget.prefixIcon,
        contentPadding: const EdgeInsets.all(16),
        enabled: widget.enabled,
      ),
    );
  }

  Widget _suffixIcon(ThemeData theme) {
    if (widget.isPassword) {
      return Semantics(
        button: true,
        attributedLabel: AttributedString('Hide Password'),
        child: IconButton(
          onPressed: () => setState(() => obscure = !obscure),
          icon: obscure
              ? Icon(PhosphorIcons.regular.eye)
              : Icon(PhosphorIcons.regular.eyeSlash),
        ),
      );
    }

    return Center(
      heightFactor: 1,
      widthFactor: 1,
      child: (widget.suffixIcon == null && widget.isFieldValid)
          ? _validIcon(theme)
          : widget.suffixIcon,
    );
  }

  Widget _validIcon(ThemeData theme) {
    return PhosphorIcon(
      PhosphorIcons.duotone.checkCircle,
      color: theme.colorScheme.onSecondary,
      duotoneSecondaryColor: theme.colorScheme.secondary,
      duotoneSecondaryOpacity: 1.0,
    );
  }
}
