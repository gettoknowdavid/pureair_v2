import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    DateTime? ts,
    int? tp,
    int? pr,
    int? hu,
    int? ws,
    int? wd,
    String? ic,
  }) = _Weather;
}
