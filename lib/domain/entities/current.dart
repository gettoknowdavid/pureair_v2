import 'package:freezed_annotation/freezed_annotation.dart';

import 'pollution.dart';
import 'weather.dart';

part 'current.freezed.dart';

@freezed
class Current with _$Current {
  const factory Current({
    Weather? weather,
    Pollution? pollution,
  }) = _Current;
}
