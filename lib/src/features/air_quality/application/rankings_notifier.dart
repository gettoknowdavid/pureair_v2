import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rankings_notifier.g.dart';

const latlng = '-90,-180,90,180';

@riverpod
class RankingsNotifier extends _$RankingsNotifier {
  @override
  FutureOr<List<Station>> build() async {
    final facade = ref.read(airQualityFacadeProvider);
    final stations = await facade.stationsOnMap(latlng);
    return stations.fold(
      (exception) => throw exception,
      (data) => data.where((city) => city.aqi != '-').toList(),
    );
  }
}
