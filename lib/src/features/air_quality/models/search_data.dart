import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pureair_v2/src/features/air_quality/models/city.dart';

part 'search_data.g.dart';

@JsonSerializable()
final class SearchData with EquatableMixin {
  const SearchData({
    required this.uid,
    required this.aqi,
    required this.station,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) =>
      _$SearchDataFromJson(json);

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

  Map<String, dynamic> toJson() => _$SearchDataToJson(this);
}
