import 'package:freezed_annotation/freezed_annotation.dart';

import 'city.dart';
import 'time.dart';

part 'search_data.freezed.dart';

@freezed
class SearchData with _$SearchData {
  factory SearchData({
    required int uid,
    required String aqi,
    required Time time,
    required City station,
  }) = _SearchData;
}
