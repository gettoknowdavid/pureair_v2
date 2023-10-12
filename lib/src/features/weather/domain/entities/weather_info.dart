import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_info.freezed.dart';

@freezed
class WeatherInfo with _$WeatherInfo {
  const factory WeatherInfo({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _WeatherInfo;
}
