import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribution.freezed.dart';
part 'attribution.g.dart';

@freezed
class Attribution with _$Attribution {
  const factory Attribution({
    String? url,
    String? name,
    String? logo,
  }) = _Attribution;

  factory Attribution.fromJson(Map<String, dynamic> json) =>
      _$AttributionFromJson(json);
}
