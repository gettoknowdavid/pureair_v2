import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/core/core.dart';

class AirQualityCardActions extends StatelessWidget {
  const AirQualityCardActions({
    required this.onCancel,
    required this.onDelete,
    super.key,
    this.onArchive,
  });

  final void Function()? onArchive;
  final void Function() onDelete;
  final void Function() onCancel;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Positioned.fill(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.3),
              gradient: const LinearGradient(
                colors: [Colors.white60, Colors.white10],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              ),
              border: Border.all(width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _AirQualityCardActionButton(
                  icon: PhosphorIconsBold.archive,
                  label: 'Archive',
                  onTap: onArchive,
                ),
                _AirQualityCardActionButton(
                  icon: PhosphorIconsBold.trash,
                  label: 'Remove',
                  iconColor: colors.error,
                  onTap: onDelete,
                ),
                _AirQualityCardActionButton(
                  icon: PhosphorIconsBold.xCircle,
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
  const _AirQualityCardActionButton({
    required this.icon,
    required this.label,
    this.iconColor,
    this.onTap,
  });

  final PhosphorIconData icon;
  final String label;
  final Color? iconColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      iconSize: 32,
      tooltip: label,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor ?? Colors.white),
          const SizedBox(height: 4),
          Text(label, style: PureAirTextTheme.of(context)?.button),
        ],
      ),
    );
  }
}
