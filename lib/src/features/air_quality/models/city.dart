//
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/features/air_quality/models/geo.dart';
import 'package:uuid/uuid.dart';

class City with EquatableMixin {
  const City({
    required this.name,
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

  final String? uid;
  final DateTime? time;
  final DateTime? addedTime;
  final String name;
  final Geo? geo;
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
    Geo? geo,
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
}

extension CityGenUidX on Geo {
  String get generateCityUid {
    final formattedLatitude = lat.toStringAsFixed(6);
    final formattedLongitude = lon.toStringAsFixed(6);

    final concatenatedValues = '$formattedLatitude|$formattedLongitude';

    final uuid = const Uuid().v5(Namespace.oid.value, concatenatedValues);

    return uuid;
  }
}
