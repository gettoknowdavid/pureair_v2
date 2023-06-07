import 'package:freezed_annotation/freezed_annotation.dart';

part 'co.freezed.dart';

@freezed
class CO with _$CO {
  const factory CO({
    num? conc,
    num? aqius,
    num? aqicn,
  }) = _CO;
}
