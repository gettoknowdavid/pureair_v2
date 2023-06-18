import 'package:freezed_annotation/freezed_annotation.dart';

part 'station.freezed.dart';

@freezed
class Station with _$Station {
  factory Station({
    String? name,
    String? country,
    List<double>? geo,
    String? url,
    DateTime? time,
  }) = _Station;
}
