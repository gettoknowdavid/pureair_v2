import 'package:cv/cv.dart';
import 'package:equatable/equatable.dart';

final class AttributionDto extends CvModelBase with EquatableMixin{
  AttributionDto();

  factory AttributionDto.fromJson(Map<String, dynamic> map) {
    final value = map.cv<AttributionDto>();
    return value;
  }

  final url = CvField<String?>('url');
  final name = CvField<String?>('name');
  final logo = CvField<String?>('logo');

  @override
  List<CvField> get fields => [url, name, logo];

@override
List<Object?> get props => [url, name, logo];
}
