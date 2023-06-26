import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

class AddButton extends AppButton {
  const AddButton({
    super.key,
    super.title = 'Add',
    super.disabled,
    super.loading,
    super.onPressed,
  });

  @override
  Color? get backgroundColor => kTertiary;

  @override
  Size? get fixedSize => const Size(70, 28);

  @override
  Widget? get icon => PhosphorIcon(PhosphorIcons.bold.plus, size: 14);

  @override
  String get title => 'Add';
}

class DetailsAddButton extends AppButton {
  const DetailsAddButton({
    super.key,
    super.title = 'Add',
    super.disabled,
    super.loading,
    super.onPressed,
  });

  @override
  Color? get backgroundColor => kTertiary;

  @override
  Size? get fixedSize => const Size(60, 28);

  @override
  String get title => 'Add';
}

class DetailsRemoveButton extends AppButton {
  const DetailsRemoveButton({
    super.key,
    super.title = 'Remove',
    super.disabled,
    super.loading,
    super.onPressed,
  });

  @override
  Color? get backgroundColor => kTertiary;

  @override
  Size? get fixedSize => const Size(60, 28);

  @override
  String get title => 'Add';
}

class GoogleButton extends AppButton {
  const GoogleButton({
    super.key,
    super.title = 'Continue with Google',
    super.disabled,
    super.loading,
    super.onPressed,
  });

  @override
  Color? get backgroundColor => kTertiary;

  @override
  Widget? get icon {
    return Container(
      height: 20,
      width: 20,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: CircleBorder(side: BorderSide()),
      ),
      child: PhosphorIcon(PhosphorIcons.bold.googleLogo, size: 18),
    );
  }

  @override
  String get title => 'Continue with Google';
}

class PrimaryButton extends AppButton {
  const PrimaryButton({
    super.key,
    required super.title,
    super.disabled,
    super.loading,
    super.onPressed,
  });
}

class TertiaryButton extends AppButton {
  const TertiaryButton({
    super.key,
    required super.title,
    super.disabled,
    super.loading,
    super.foregroundColor,
    super.onPressed,
  });

  @override
  Color? get backgroundColor => Colors.transparent;
}

sealed class AppButton extends StatefulWidget {
  final bool disabled;
  final bool loading;
  final void Function()? onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? icon;
  final Size? fixedSize;

  const AppButton({
    super.key,
    this.disabled = false,
    this.loading = false,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    required this.title,
    this.icon,
    this.fixedSize,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  late Widget button;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (widget.icon == null) {
      button = _buildFlatButton(context);
    } else {
      button = _buildIconFlatButton(context);
    }

    return AppContainer(
      disabled: widget.disabled,
      borderColor: colorScheme.onBackground,
      child: button,
    );
  }

  FilledButton _buildFlatButton(BuildContext context) {
    return FilledButton(
      key: widget.key,
      onPressed: widget.loading || widget.disabled ? null : widget.onPressed,
      style: _buttonStyle(context),
      child: widget.loading ? const Loading() : Text(widget.title),
    );
  }

  FilledButton _buildIconFlatButton(BuildContext context) {
    return FilledButton.icon(
      key: widget.key,
      onPressed: widget.loading || widget.disabled ? null : widget.onPressed,
      style: _buttonStyle(context),
      icon: widget.icon ?? 0.horizontalSpace,
      label: widget.loading ? const Loading() : Text(widget.title),
    );
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = Theme.of(context).colorScheme;
    return FilledButton.styleFrom(
      fixedSize: widget.fixedSize ?? Size(size.width, 51.0),
      backgroundColor: widget.backgroundColor ?? colorScheme.primary,
      foregroundColor: widget.foregroundColor ?? colorScheme.onPrimary,
      padding: EdgeInsets.zero,
    );
  }
}
