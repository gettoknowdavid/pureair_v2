import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
class City with _$City {
  const factory City({
    required String name,
    int? id,
    String? uid,
    List<double>? geo,
    String? url,
    String? location,
    String? country,
    DateTime? time,
    DateTime? addedTime,
    bool? isLocal,
    int? aqi,
    String? flagUrl,
    String? localeName,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
