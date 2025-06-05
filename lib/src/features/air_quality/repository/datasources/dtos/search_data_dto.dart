import 'package:cv/cv.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/features/air_quality/repository/datasources/dtos/dtos.dart';

final class SearchDataDto extends CvModelBase with EquatableMixin {
  SearchDataDto();

  factory SearchDataDto.fromJson(Map<String, dynamic> map) {
    cvAddBuilder<SearchDataDto>((_) => SearchDataDto());
    cvAddBuilder<CityDto>((_) => CityDto());
    cvAddBuilder<GeoDto>((_) => GeoDto());

    final value = map.cv<SearchDataDto>();
    return value;
  }

  final uid = CvField<int>('uid');
  final aqi = CvField<String>('aqi');
  final station = CvModelField<CityDto>.builder(
    'station',
    builder: (data) {
      final geo = GeoDto.fromList(data['geo'] as List<dynamic>);
      return data.cv<CityDto>()..geo.v = geo;
    },
  );

  @override
  List<CvField> get fields => [uid, aqi, station];

  @override
  List<Object?> get props => [uid, aqi, station];
}
