import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class State with _$State {
  factory State({
    required String name,
  }) = _State;
}
