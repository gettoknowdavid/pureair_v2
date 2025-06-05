import 'package:cv/cv_json.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/features/air_quality/repository/datasources/dtos/dtos.dart';

final class AirQualityDto extends CvModelBase with EquatableMixin {
  AirQualityDto();

  factory AirQualityDto.fromJson(Map<String, dynamic> map) {
    cvAddBuilder<AirQualityDto>((_) => AirQualityDto());
    cvAddBuilder<AttributionDto>((_) => AttributionDto());
    cvAddBuilder<CityDto>((_) => CityDto());
    cvAddBuilder<GeoDto>((_) => GeoDto());
    cvAddBuilder<IAqiDto>((_) => IAqiDto());
    cvAddBuilder<ParameterDto>((_) => ParameterDto());
    cvAddBuilder<ForecastDto>((_) => ForecastDto());
    cvAddBuilder<ForecastDataDto>((_) => ForecastDataDto());
    cvAddBuilder<DailyForecastDto>((_) => DailyForecastDto());

    final value = map.cv<AirQualityDto>();
    return value;
  }

  final value = CvField<int>('aqi');
  final dominantPol = CvField<String>('dominentpol');
  final idx = CvField<int>('idx');
  final attributions = CvModelListField<AttributionDto>.builder('attributions');
  final city = CvModelField<CityDto>.builder(
    'city',
    builder: (data) {
      final geo = GeoDto.fromList(data['geo'] as List<dynamic>);
      return data.cv<CityDto>()..geo.v = geo;
    },
  );
  final iaqi = CvModelField<IAqiDto>.builder('iaqi');
  final forecast = CvModelField<ForecastDto>.builder('forecast');

  @override
  List<CvField> get fields => [
        value,
        dominantPol,
        idx,
        attributions,
        city,
        iaqi,
        forecast,
      ];

  @override
  List<Object?> get props => [
        value,
        dominantPol,
        idx,
        attributions,
        city,
        iaqi,
        forecast,
      ];
}
