import 'package:cv/cv.dart';
import 'package:equatable/equatable.dart';

final class GeoDto extends CvModelBase with EquatableMixin {
  GeoDto();

  factory GeoDto.fromJson(Map<String, dynamic> map) {
    cvAddBuilder<GeoDto>((_) => GeoDto());
    final value = map.cv<GeoDto>();
    return value;
  }

  factory GeoDto.fromList(List<dynamic> geo) {
    if (geo.length != 2) {
      throw ArgumentError('Invalid geo');
    }

    final newGeo = GeoDto();
    newGeo.lat.v = double.parse(geo[0].toString());
    newGeo.lon.v = double.parse(geo[1].toString());
    return newGeo;
  }

  final lat = CvField<double>('lat');
  final lon = CvField<double>('lon');

  List<double> toList() => [lat.v!, lon.v!];

  @override
  List<CvField> get fields => [lat, lon];

  @override
  List<Object?> get props => [lat, lon];
}
