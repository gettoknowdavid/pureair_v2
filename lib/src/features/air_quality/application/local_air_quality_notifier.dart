import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_air_quality_notifier.g.dart';

@riverpod
class LocalAirQuality extends _$LocalAirQuality {
  @override
  FutureOr<AirQuality> build() => fetch();

  FutureOr<AirQuality> fetch() async {
    final facade = ref.watch(airQualityFacadeProvider);
    final result = await facade.getLocalized();
    return result.fold((error) => throw error, (airQuality) => airQuality);
  }

  void refresh() => ref.invalidateSelf();
}
