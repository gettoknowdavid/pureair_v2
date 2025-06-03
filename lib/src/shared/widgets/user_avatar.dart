import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/router/routing.dart';

const _constraints = BoxConstraints(
  maxHeight: 40,
  minHeight: 40,
  maxWidth: 40,
  minWidth: 40,
);

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;

    final imageUrl = context.select((AuthBloc b) => b.state.user.imageUrl);

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
      onPressed: () => const ProfileRoute().go(context),
      child: image,
    );
  }
}
