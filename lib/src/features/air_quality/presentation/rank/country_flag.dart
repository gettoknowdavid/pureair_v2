import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart'; 
import 'package:pureair_v2/injector/injector.dart'; 
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../common/common.dart';
import '../../../../services/services.dart';
import '../../domain/entities/entities.dart';

class CountryFlag extends StatelessWidget {
  final City city;
  const CountryFlag({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: 40,
      width: 50,
      child: FutureBuilder<Flag>(
        future: di<LocationService>().getFlag(city.geo!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Shimmer(
              enabled: true,
              child: Container(
                height: 50,
                width: 50,
                color: Theme.of(context).colorScheme.background,
              ),
            );
          } else if (snapshot.hasError) {
            return PhosphorIcon(PhosphorIcons.regular.flag);
          } else {
            return snapshot.data!;
          }
        },
      ),
    );
  }
}
