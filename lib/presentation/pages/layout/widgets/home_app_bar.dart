import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

const _avatarHeight = kToolbarHeight * 0.7;
const _boxShadow = [
  BoxShadow(
    color: Colors.black12,
    blurRadius: 6,
    spreadRadius: 0.9,
  )
];
const _iconHeight = kToolbarHeight * 0.5;
const _leadingMargin = EdgeInsets.only(left: 14);

class HomeAppBar extends StatelessWidget {
  final void Function()? onTap;
  const HomeAppBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _Avatar(onTap: onTap),
      actions: [
        _NotificationIcon(onTap: () {}),
        kGlobalPadding.horizontalSpace,
        InkWell(
          onTap: () {},
          child: PhosphorIcon(PhosphorIcons.regular.nut),
        ),
        14.horizontalSpace,
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  final void Function()? onTap;
  const _Avatar({this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => Center(
        child: state.mapOrNull(
          authenticated: (value) {
            final imageUrl = value.user.avatar;
            return InkWell(
              onTap: onTap,
              child: AppContainer(
                height: _avatarHeight,
                width: _avatarHeight,
                margin: _leadingMargin,
                boxShadow: _boxShadow,
                borderColor: Colors.white,
                child: imageUrl == null
                    ? PhosphorIcon(PhosphorIcons.bold.user, color: kOnPrimary)
                    : _buildImage(imageUrl),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, progress) {
        if (progress.progress != 100) {
          return Shimmer(child: Container(color: Colors.grey));
        }
        return const SizedBox();
      },
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  final void Function()? onTap;
  const _NotificationIcon({this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: _iconHeight,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Align(
              alignment: Alignment.center,
              child: PhosphorIcon(PhosphorIcons.regular.bell),
            ),
            const Material(
              color: Colors.red,
              shape: CircleBorder(),
              child: SizedBox(height: 5, width: 5),
            )
          ],
        ),
      ),
    );
  }
}
