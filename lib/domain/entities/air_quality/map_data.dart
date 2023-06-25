import 'package:freezed_annotation/freezed_annotation.dart';

import 'city.dart';

part 'map_data.freezed.dart';

@freezed
class MapData with _$MapData {
  factory MapData({
    required double lat,
    required double lon,
    required int uid,
    required String aqi,
    required City station,
  }) = _MapData;
}
