import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';

@freezed
class City with _$City {
  factory City({
    required List<double> geo,
    required String name,
    String? url,
    String? location,
  }) = _City;
}
