// ignore_for_file: use_setters_to_change_properties

import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rankings_notifier.g.dart';

const latlng = '-90,-180,90,180';

enum Rank { top10, bottom10, best, worst }

@Riverpod(dependencies: [])
class RankNotifier extends _$RankNotifier {
  @override
  Rank build() => Rank.top10;

  void onChange(Rank rank) => state = rank;
}

@Riverpod(keepAlive: true, dependencies: [])
FutureOr<List<Station>> stations(Ref ref) async {
  Timer? timer;

  ref.onDispose(() => timer?.cancel());

  timer = Timer.periodic(const Duration(minutes: 10), (_) {
    ref.invalidateSelf();
  });

  final facade = ref.read(airQualityFacadeProvider);
  final result = await facade.stationsOnMap(latlng);
  final stations = result.getOrElse(() => []);
  final cleanList = stations.where((e) => e.aqi != '-').toList();
  return cleanList;
}

@Riverpod(dependencies: [RankNotifier, stations])
List<City> rankings(Ref ref) {
  final rank = ref.watch(rankNotifierProvider);
  final stations = ref.watch(stationsProvider);
  return stations.maybeWhen(data: rank.apply, orElse: () => []);
}

extension RankX on Rank {
  List<City> apply(List<Station> data) {
    var list = List<Station>.from(data);

    switch (this) {
      case Rank.top10:
        list.sort((a, b) => int.parse(a.aqi).compareTo(int.parse(b.aqi)));
        list = list.sublist(0, 10);
      case Rank.bottom10:
        list.sort((a, b) => int.parse(b.aqi).compareTo(int.parse(a.aqi)));
        list = list.sublist(0, 10);
      case Rank.best:
        list.sort((a, b) => int.parse(a.aqi).compareTo(int.parse(b.aqi)));
        list = list.sublist(0, 20);
      case Rank.worst:
        list.sort((a, b) => int.parse(b.aqi).compareTo(int.parse(a.aqi)));
        list = list.sublist(0, 20);
    }

    return list.map((station) {
      return City(
        name: station.city.name,
        aqi: int.tryParse(station.aqi) ?? 0,
        geo: [station.lat, station.lon],
        uid: station.uid.toString(),
      );
    }).toList();
  }

  String get name {
    switch (this) {
      case Rank.best:
        return 'Best Cities';
      case Rank.top10:
        return 'Top 10';
      case Rank.bottom10:
        return 'Bottom 10';
      case Rank.worst:
        return 'Worst Cities';
    }
  }
}
