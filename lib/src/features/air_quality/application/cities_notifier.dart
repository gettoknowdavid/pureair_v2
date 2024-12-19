import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cities_notifier.g.dart';

@riverpod
class CitiesNotifier extends _$CitiesNotifier {
  @override
  FutureOr<List<AirQuality?>> build() async {
    final facade = ref.read(airQualityFacadeProvider);
    final cities = await facade.getCitiesAirQualityData();
    return cities.fold((exception) => throw exception, (data) => data);
  }

  Future<void> addCity(City city) async {
    state = const AsyncLoading();
    final cityWithUid = city.copyWith(uid: city.geo?.generateCityUid);
    ref.read(airQualityFacadeProvider).addCity(cityWithUid);
    ref.invalidateSelf();
    await future;
  }

  void removeCity(City city) {
    ref.read(airQualityFacadeProvider).removeCity(city);
    ref.invalidateSelf();
  }
}
