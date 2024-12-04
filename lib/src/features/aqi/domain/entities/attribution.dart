import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribution.freezed.dart';

@freezed
class Attribution with _$Attribution {
  const factory Attribution({
    String? url,
    String? name,
    String? logo,
  }) = _Attribution;
}
