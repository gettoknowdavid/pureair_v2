import 'package:cv/cv.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/features/air_quality/repository/datasources/dtos/daily_forecast.dart';

final class ForecastDataDto extends CvModelBase with EquatableMixin {
  ForecastDataDto();

  factory ForecastDataDto.fromJson(Map<String, dynamic> map) {
    final value = map.cv<ForecastDataDto>();
    return value;
  }

  final o3 = CvModelListField<DailyForecastDto>('o3');
  final pm10 = CvModelListField<DailyForecastDto>('pm10');
  final pm25 = CvModelListField<DailyForecastDto>('pm25');
  final uvi = CvModelListField<DailyForecastDto>('uvi');
  final co = CvModelListField<DailyForecastDto>('co');
  final no2 = CvModelListField<DailyForecastDto>('no2');
  final so2 = CvModelListField<DailyForecastDto>('so2');

  @override
  List<CvField> get fields => [o3, pm10, pm25, uvi, co, no2, so2];

@override
List<Object?> get props => [o3, pm10, pm25, uvi, co, no2, so2];
}
