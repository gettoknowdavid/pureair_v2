import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'details_notifier.g.dart';

@Riverpod(keepAlive: true)
class DetailsNotifier extends _$DetailsNotifier {
  @override
  FutureOr<AirQuality?> build() async => future;

  AirQuality initWithValue(AirQuality airQuality) {
    state = AsyncData(airQuality);
    return airQuality;
  }

  Future<void> initWithGeo(List<double> geo) async {
    state = const AsyncLoading();
    final result = await ref.read(airQualityFacadeProvider).getByGeo(geo);
    state = result.fold(
      (exception) => AsyncError(exception, StackTrace.current),
      AsyncData.new,
    );
  }
}
