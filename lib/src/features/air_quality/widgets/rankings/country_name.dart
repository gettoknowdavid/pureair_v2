// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:pureair_v2/src/core/core.dart';
// import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class CountryName extends StatelessWidget {
//   const CountryName({this.geo, super.key});
//   final List<double>? geo;

//   @override
//   Widget build(BuildContext context) {
//     final style = PureAirTextTheme.of(context)!.caption;

//     final skeleton = Skeletonizer(child: Text(BoneMock.name, style: style));

//     final stations = ref.watch(stationsProvider);

//     return stations.maybeWhen(
//       orElse: () => const SizedBox(),
//       loading: () => skeleton,
//       data: (_) {
//         final country = ref.watch(countryProvider(geo!));
//         return country.maybeWhen(
//           orElse: () => const SizedBox(),
//           loading: () => skeleton,
//           data: (data) => Text(data, style: style),
//         );
//       },
//     );
//   }
// }
