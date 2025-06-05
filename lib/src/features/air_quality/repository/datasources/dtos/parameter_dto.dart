import 'package:cv/cv.dart';
import 'package:equatable/equatable.dart';

final class ParameterDto extends CvModelBase with EquatableMixin {
  ParameterDto();

  factory ParameterDto.fromJson(Map<String, dynamic> map) {
    final value = map.cv<ParameterDto>();
    return value;
  }

  final value = CvField<num>('v');

  @override
  List<CvField> get fields => [value];

@override
List<Object?> get props => [value];
}
