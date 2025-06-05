import 'package:cv/cv.dart';
import 'package:equatable/equatable.dart';

final class DailyForecastDto extends CvModelBase with EquatableMixin  {
  DailyForecastDto();

  factory DailyForecastDto.fromJson(Map<String, dynamic> map) {
    final value = map.cv<DailyForecastDto>();
    return value;
  }

  final avg = CvField<num>('avg');
  final max = CvField<int>('max');
  final min = CvField<int>('min');
  final day = CvField<DateTime?>('day');

  @override
  List<CvField> get fields => [avg, max, min, day];

@override
List<Object?> get props => [avg, max, min, day];
}
