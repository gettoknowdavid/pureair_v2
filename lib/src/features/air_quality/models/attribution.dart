import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attribution.g.dart';

@JsonSerializable()
final class Attribution with EquatableMixin {
  const Attribution({this.url, this.name, this.logo});

  factory Attribution.fromJson(Map<String, dynamic> json) =>
      _$AttributionFromJson(json);

  final String? url;
  final String? name;
  final String? logo;

  @override
  List<Object?> get props => [url, name, logo];

  Attribution copyWith({String? url, String? name, String? logo}) {
    return Attribution(
      url: url ?? this.url,
      name: name ?? this.name,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toJson() => _$AttributionToJson(this);
}
