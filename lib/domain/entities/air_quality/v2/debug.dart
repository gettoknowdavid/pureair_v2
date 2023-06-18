import 'package:freezed_annotation/freezed_annotation.dart';

part 'debug.freezed.dart';

@freezed
class Debug with _$Debug {
  const factory Debug({
    required String sync,
  }) = _Debug;
}
