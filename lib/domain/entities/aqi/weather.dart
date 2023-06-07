import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    DateTime? ts,
    num? tp,
    num? pr,
    num? hu,
    num? ws,
    num? wd,
    String? ic,
  }) = _Weather;
}
