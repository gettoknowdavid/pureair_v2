import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'city_dto.freezed.dart';
part 'city_dto.g.dart';

@Freezed(toJson: true, addImplicitFinal: false)
class CityDto with _$CityDto {
  @Entity(realClass: CityDto)
  factory CityDto({
    int? id,
    @Unique() String? uid,
    final List<double>? geo,
    required final String name,
    final String? url,
    final String? location,
    final String? country,
    @Property(type: PropertyType.date) final DateTime? time,
    @Property(type: PropertyType.date) final DateTime? addedTime,
    final bool? isLocal,
    int? aqi,
    String? flagUrl,
    String? localeName,
  }) = _CityDto;

  factory CityDto.fromJson(Map<String, dynamic> json) =>
      _$CityDtoFromJson(json);
}
