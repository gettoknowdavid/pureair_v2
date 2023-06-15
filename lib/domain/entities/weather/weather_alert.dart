import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_alert.freezed.dart';

@freezed
class WeatherAlert with _$WeatherAlert {
  const factory WeatherAlert({
    String? senderName,
    String? event,
    int? start,
    int? end,
    String? description,
    List<String?>? tags,
  }) = _WeatherAlert;
}
