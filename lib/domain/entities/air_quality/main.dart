import 'package:freezed_annotation/freezed_annotation.dart';

part 'main.freezed.dart';

@freezed
class Main with _$Main {
  const factory Main({
    int? aqi,
  }) = _Main;
}
