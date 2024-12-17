import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/features/air_quality/domain/entities/city.dart';

part 'search_data.freezed.dart';
part 'search_data.g.dart';

@freezed
class SearchData with _$SearchData {
  const factory SearchData({
    required int uid,
    required String aqi,
    required City station,
  }) = _SearchData;

  factory SearchData.fromJson(Map<String, dynamic> json) =>
      _$SearchDataFromJson(json);
}
