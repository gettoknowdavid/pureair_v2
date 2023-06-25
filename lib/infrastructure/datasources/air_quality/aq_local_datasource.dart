import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/infrastructure/infrastructure.dart';
import 'package:pureair_v2/services/services.dart';

@lazySingleton
class AQLocalDatasource {
  final SharedPreferencesService _preferencesService;

  AQLocalDatasource(this._preferencesService);

  Future<void> saveCities(List<CityDto?> cities) async {
    // Convert the list of objects to a list of JSON strings
    List<String> jsonList = cities.map((e) => jsonEncode(e?.toJson())).toList();

    // Save the list of JSON strings to SharedPreferences
    await _preferencesService.writeList(key: AppKeys.cities, value: jsonList);
  }

  Future<void> clearSavedCities() => _preferencesService.delete(AppKeys.cities);

  Future<List<CityDto?>> loadCities() async {
    // Retrieve the list of JSON strings from SharedPreferences
    List<String>? jsonList = _preferencesService.readList(AppKeys.cities);

    // If the list doesn't exist, return an empty list
    if (jsonList == null) {
      return [];
    }

    // Convert the list of JSON strings to a list of objects
    List<CityDto?> cities =
        jsonList.map((e) => CityDto.fromJson(jsonDecode(e))).toList();

    return cities;
  }
}
