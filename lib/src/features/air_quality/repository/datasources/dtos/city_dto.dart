import 'package:cv/cv.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/features/air_quality/repository/datasources/dtos/geo_dto.dart';

final class CityDto extends CvModelBase with EquatableMixin {
  CityDto();

  factory CityDto.fromJson(Map<String, dynamic> map) {
    final value = map.cv<CityDto>();
    return value;
  }

  final uid = CvField<String?>('uid');
  final time = CvField<DateTime?>('time');
  final addedTime = CvField<DateTime?>('addedTime');
  final name = CvField<String?>('name');
  final geo = CvModelField<GeoDto>.builder('geo');
  final url = CvField<String?>('url');
  final location = CvField<String?>('location');
  final country = CvField<String?>('country');
  final isLocal = CvField<bool>('isLocal', false);
  final aqi = CvField<int?>('aqi');
  final flagUrl = CvField<String?>('flagUrl');
  final localeName = CvField<String?>('localeName');

  @override
  List<CvField> get fields => [
        name,
        uid,
        geo,
        url,
        location,
        country,
        isLocal,
        aqi,
        flagUrl,
        localeName,
        time,
        addedTime,
      ];

  @override
  List<Object?> get props => [
        uid,
        time,
        addedTime,
        name,
        geo,
        url,
        location,
        country,
        isLocal,
        aqi,
        flagUrl,
        localeName,
      ];
}
