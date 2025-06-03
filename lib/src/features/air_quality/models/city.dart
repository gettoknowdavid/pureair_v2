// 
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';

part 'city.g.dart';

@Entity()
@JsonSerializable()
class City with EquatableMixin {
  City({
    required this.name,
    this.id = 0,
    this.isLocal = false,
    this.uid,
    this.geo,
    this.url,
    this.location,
    this.country,
    this.aqi,
    this.flagUrl,
    this.localeName,
    this.time,
    this.addedTime,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  int? id;

  @Unique()
  final String? uid;

  @Property(type: PropertyType.date)
  final DateTime? time;

  @Property(type: PropertyType.date)
  final DateTime? addedTime;

  final String name;
  final List<double>? geo;
  final String? url;
  final String? location;
  final String? country;
  final bool isLocal;
  final int? aqi;
  final String? flagUrl;
  final String? localeName;

  @override
  List<Object?> get props => [
        name,
        uid,
        geo,
        url,
        location,
        country,
        isLocal,
        aqi,
        flagUrl,
        localeName,
        time,
        addedTime
      ];
      
  City copyWith({
    String? name,
    String? uid,
    List<double>? geo,
    String? url,
    String? location,
    String? country,
    bool? isLocal,
    int? aqi,
    String? flagUrl,
    String? localeName,
    DateTime? time,
    DateTime? addedTime,
  }) {
    return City(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      geo: geo ?? this.geo,
      url: url ?? this.url,
      location: location ?? this.location,
      country: country ?? this.country,
      isLocal: isLocal ?? this.isLocal,
      aqi: aqi ?? this.aqi,
      flagUrl: flagUrl ?? this.flagUrl,
      localeName: localeName ?? this.localeName,
      time: time ?? this.time,
      addedTime: addedTime ?? this.addedTime,
    );
  }

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

extension CityGenUidX on List<double> {
  String get generateCityUid {
    final formattedLatitude = this[0].toStringAsFixed(6);
    final formattedLongitude = this[1].toStringAsFixed(6);

    final concatenatedValues = '$formattedLatitude|$formattedLongitude';

    final uuid = const Uuid().v5(Namespace.oid.value, concatenatedValues);

    return uuid;
  }
}
