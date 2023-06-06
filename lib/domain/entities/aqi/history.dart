import 'package:freezed_annotation/freezed_annotation.dart';

import 'pollution.dart';
import 'weather.dart';

part 'history.freezed.dart';

@freezed
class History with _$History {
  const factory History({
    List<Weather>? weather,
    List<Pollution>? pollution,
  }) = _History;
}
