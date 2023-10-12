import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/constants/constants.dart';

class AirQualityCardActions extends StatelessWidget {
  final void Function()? onArchive;
  final void Function() onDelete;
  final void Function() onCancel;

  const AirQualityCardActions({
    super.key,
    this.onArchive,
    required this.onCancel,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Positioned.fill(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              gradient: const LinearGradient(
                colors: [Colors.white60, Colors.white10],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              ),
              border: Border.all(width: 2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _AirQualityCardActionButton(
                  icon: PhosphorIcons.duotone.archive,
                  label: 'Archive',
                  onTap: onArchive,
                ),
                _AirQualityCardActionButton(
                  icon: PhosphorIcons.duotone.trash,
                  label: 'Remove',
                  iconColor: colorScheme.error,
                  onTap: onDelete,
                ),
                _AirQualityCardActionButton(
                  icon: PhosphorIcons.duotone.xCircle,
                  label: 'Cancel',
                  onTap: onCancel,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AirQualityCardActionButton extends StatelessWidget {
  final PhosphorIconData icon;
  final String label;
  final Color? iconColor;
  final void Function()? onTap;

  const _AirQualityCardActionButton({
    required this.icon,
    required this.label,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return IconButton(
      onPressed: onTap,
      iconSize: 32,
      tooltip: label,
      icon: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(icon, color: iconColor),
          4.verticalSpace,
          Text(label, style: textTheme.labelSmall),
        ],
      ),
    );
  }
}
