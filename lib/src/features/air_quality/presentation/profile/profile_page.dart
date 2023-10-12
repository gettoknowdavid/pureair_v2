import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/constants/constants.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../common/common.dart';
import '../../../auth/application/application.dart';
import '../../../map/application/map_cubit/map_cubit.dart';
import 'profile_tile.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => state.maybeMap(
        orElse: () => const SizedBox(),
        authenticated: (value) => LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: kHorizontalPadding18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kToolbarHeight.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Avatar(height: constraints.minHeight * 0.15),
                    12.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _Name(),
                          2.verticalSpace,
                          const _Email(),
                          1.verticalSpace,
                          const _Location(),
                        ],
                      ),
                    ),
                  ],
                ),
                50.verticalSpace,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileTile(
                      title: 'Account',
                      leading: PhosphorIcon(PhosphorIcons.duotone.pencil),
                    ),
                    15.verticalSpace,
                    ProfileTile(
                      title: 'Saved Cities',
                      leading: PhosphorIcon(PhosphorIcons.duotone.heart),
                    ),
                    15.verticalSpace,
                    ProfileTile(
                      title: 'Health Condition',
                      leading: PhosphorIcon(PhosphorIcons.duotone.pulse),
                    ),
                    15.verticalSpace,
                    ProfileTile(
                      title: 'Settings',
                      leading: PhosphorIcon(PhosphorIcons.duotone.nut),
                    ),
                    15.verticalSpace,
                    ProfileTile(
                      title: 'About',
                      leading: PhosphorIcon(PhosphorIcons.duotone.info),
                    ),
                    15.verticalSpace,
                    ProfileTile(
                      title: 'Logout',
                      showTrailing: false,
                      onTap: () {
                        context
                            .read<AuthBloc>()
                            .add(const AuthEvent.logoutPressed());
                      },
                      leading: PhosphorIcon(PhosphorIcons.duotone.signOut),
                    ),
                    15.verticalSpace,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final double height;
  const _Avatar({required this.height});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, String?>(
      selector: (state) => state.whenOrNull(authenticated: (u) => u.photoURL),
      builder: (context, imageUrl) {
        Widget child;

        if (imageUrl == null) {
          child = PhosphorIcon(PhosphorIcons.bold.user, color: kOnPrimary);
        } else {
          child = CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, download) {
              if (download.progress != 100) {
                return Shimmer(child: Container());
              }
              return const SizedBox();
            },
          );
        }

        return AppContainer(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.grey,
          borderColor: Colors.white,
          height: height,
          width: height,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              spreadRadius: 3,
            )
          ],
          child: child,
        );
      },
    );
  }
}

class _Email extends StatelessWidget {
  const _Email();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocSelector<AuthBloc, AuthState, String>(
      selector: (s) => s.whenOrNull(authenticated: (u) => u.email!.get())!,
      builder: (context, email) => Text(
        email,
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _Location extends StatelessWidget {
  const _Location();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocSelector<MapCubit, MapState, String?>(
      selector: (state) {
        if (state.myCity == null && state.myCountry == null) {
          return null;
        }

        return "${state.myCity}, ${state.myCountry}";
      },
      builder: (context, myLocation) {
        if (myLocation == null) {
          return const SizedBox();
        }
        return Text(
          myLocation,
          style: textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: textTheme.labelLarge?.color?.withOpacity(0.5),
          ),
        );
      },
    );
  }
}

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge;
    return BlocSelector<AuthBloc, AuthState, String>(
      selector: (s) =>
          s.whenOrNull(authenticated: (u) => u.displayName!.get())!,
      builder: (context, name) => Text(
        name,
        style: style?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
