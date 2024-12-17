import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/application/application.dart';

const _constraints = BoxConstraints(
  maxHeight: 40,
  minHeight: 40,
  maxWidth: 40,
  minWidth: 40,
);

class UserAvatar extends ConsumerWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme.onSurface;

    final imageUrl = ref.watch(userProvider.select((value) => value?.imageUrl));

    Widget image;

    if (imageUrl == null) {
      image = const Icon(PhosphorIconsBold.user);
    } else {
      image = CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const Icon(PhosphorIconsBold.user),
      );
    }

    return RawMaterialButton(
      elevation: 12,
      constraints: _constraints,
      shape: RoundedRectangleBorder(side: BorderSide(width: 3, color: color)),
      onPressed: () => context.go(R.profile),
      child: image,
    );
  }
}
