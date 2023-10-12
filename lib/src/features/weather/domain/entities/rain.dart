import 'package:freezed_annotation/freezed_annotation.dart';

part 'rain.freezed.dart';

@freezed
class Rain with _$Rain {
  const factory Rain({
    double? the1H,
  }) = _Rain;
}
