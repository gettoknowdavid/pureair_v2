import 'package:cv/cv.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/features/air_quality/repository/datasources/dtos/forecast_data_dto.dart';

final class ForecastDto extends CvModelBase with EquatableMixin {
  ForecastDto();

  factory ForecastDto.fromJson(Map<String, dynamic> map) {
    final value = map.cv<ForecastDto>();
    return value;
  }

  final data = CvModelField<ForecastDataDto>.builder('daily');

  @override
  List<CvField> get fields => [data];

@override
List<Object?> get props => [data];
}
