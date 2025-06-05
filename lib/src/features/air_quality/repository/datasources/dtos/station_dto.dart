import 'package:cv/cv.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/features/air_quality/repository/datasources/dtos/dtos.dart';

final class StationDto extends CvModelBase with EquatableMixin {
  StationDto();

  factory StationDto.fromJson(Map<String, dynamic> map) {
    cvAddBuilder<CityDto>((_) => CityDto());
    cvAddBuilder<GeoDto>((_) => GeoDto());
    final value = map.cv<StationDto>();
    return value;
  }

  final lat = CvField<double>('lat');
  final lon = CvField<double>('lon');
  final uid = CvField<num>('uid');
  final aqi = CvField<String>('aqi');
  final city = CvModelField<CityDto>.builder('station');

  @override
  List<CvField> get fields => [lat, lon, uid, aqi, city];

  @override
  List<Object?> get props => [lat, lon, uid, aqi, city];
}
