import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SizedBox(child: state.mapOrNull(
          authenticated: (value) {
            return LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      18.verticalSpace,
                      const _Avatar(),
                      20.verticalSpace,
                      Text(
                        'David Michael',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        value.user.email!.get()!,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
          },
        ));
      },
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return AppContainer(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.grey,
          child: state.mapOrNull(
            loading: (_) => Shimmer(child: Container()),
            authenticated: (value) {
              final imageUrl = value.user.avatar;

              if (imageUrl == null) {
                return PhosphorIcon(PhosphorIcons.bold.user, color: kOnPrimary);
              }

              return CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) {
                  if (progress.progress != 100) {
                    return Shimmer(child: Container());
                  }
                  return const SizedBox();
                },
              );
            },
          ),
        );
      },
    );
  }
}
