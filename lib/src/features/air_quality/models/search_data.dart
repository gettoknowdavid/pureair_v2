import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/features/air_quality/models/city.dart';

final class SearchData with EquatableMixin {
  const SearchData({
    required this.uid,
    required this.aqi,
    required this.station,
  });

  final int uid;
  final String aqi;
  final City station;

  @override
  List<Object?> get props => [uid, aqi, station];

  SearchData copyWith({
    int? uid,
    String? aqi,
    City? station,
  }) {
    return SearchData(
      uid: uid ?? this.uid,
      aqi: aqi ?? this.aqi,
      station: station ?? this.station,
    );
  }
}
