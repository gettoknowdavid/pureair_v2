import 'package:equatable/equatable.dart';

final class Attribution with EquatableMixin {
  const Attribution({this.url, this.name, this.logo});

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
}
