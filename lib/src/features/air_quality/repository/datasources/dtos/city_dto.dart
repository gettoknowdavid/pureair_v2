//
// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:collection';
import 'dart:convert';

import 'package:cv/cv.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/database/database.dart';
import 'package:pureair_v2/src/exceptions/pure_air_exception.dart';
import 'package:pureair_v2/src/features/air_quality/repository/datasources/dtos/geo_dto.dart';

final class CityDto extends DbRecord with EquatableMixin {
  CityDto();

  factory CityDto.fromJson(Map<String, dynamic> map) {
    cvAddBuilder<CityDto>((_) => CityDto());
    cvAddBuilder<GeoDto>((_) => GeoDto());
    final value = map.cv<CityDto>();

    if (map.containsKey('geo') && map['geo'] != null && map['geo'] is String) {
      try {
        final geoMap = jsonDecode(map['geo'] as String) as Map<String, dynamic>;
        // Use GeoDto's fromJson method (which expects a Map)
        value.geo.v = GeoDto.fromJson(geoMap);
      } catch (e) {
        value.geo.v = null;
      }
    } else {
      value.geo.v = null;
    }

    return value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    // Manually map fields from CityDto's CvFields to the SQLite map
    // Only include fields that have a value or a default value
    map[citiesColUid] = uid.v;
    map[citiesColName] = name.v;
    map[citiesColUrl] = url.v;
    map[citiesColLocation] = location.v;
    map[citiesColCountry] = country.v;
    map[citiesColAQI] = aqi.v;
    map[citiesColFlagUrl] = flagUrl.v;
    map[citiesColLocaleName] = localeName.v;
    map[citiesColTime] = time.v;
    map[citiesColAddedTime] = addedTime.v;
    map[citiesColIsLocal] = isLocal.v;

    if (geo.v != null) {
      map['geo'] = jsonEncode(geo.v!.toMap());
    } else {
      map['geo'] = null;
    }

    // Remove the 'id' if it's null (for new insertions)
    // so SQLite auto-increments
    if (map.containsKey(columnId) && map[columnId] == null) {
      map.remove(columnId);
    }

    return map;
  }

  final uid = CvField<String?>('uid');
  final time = CvField<int?>('time');
  final addedTime = CvField<int>(
    'addedTime',
    DateTime.now().millisecondsSinceEpoch,
  );
  final name = CvField<String?>('name');
  final geo = CvModelField<GeoDto>.builder(
    'geo',
    builder: (data) => GeoDto.fromList(data['geo'] as List<dynamic>),
  );
  final url = CvField<String?>('url');
  final location = CvField<String?>('location');
  final country = CvField<String?>('country');
  final isLocal = CvField<int>('isLocal', 0);
  final aqi = CvField<int?>('aqi');
  final flagUrl = CvField<String?>('flagUrl');
  final localeName = CvField<String?>('localeName');

  @override
  List<CvField> get fields => [
        id,
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
        addedTime,
      ];

  @override
  List<Object?> get props => [
        uid,
        time,
        addedTime,
        name,
        geo,
        url,
        location,
        country,
        isLocal,
        aqi,
        flagUrl,
        localeName,
      ];
}

class DbCities extends ListBase<CityDto> {
  DbCities(this.list) {
    _cacheNotes = List.generate(list.length, (index) => null);
  }

  final List<Map<String, Object?>> list;
  late List<CityDto?> _cacheNotes;

  @override
  int get length => list.length;

  @override
  CityDto operator [](int index) {
    return _cacheNotes[index] ??= CityDto.fromJson(list[index]);
  }

  @override
  void operator []=(int index, CityDto value) {
    throw const PureAirException('Read only');
  }

  @override
  set length(int newLength) {
    throw const PureAirException('Read only');
  }
}
