import 'package:freezed_annotation/freezed_annotation.dart';

part 'pollutants.freezed.dart';

@freezed
class Pollutants with _$Pollutants {
  const factory Pollutants({
    Map<String, num>? components,
  }) = _Pollutants;
}
