import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pureair_v2/services/services.dart';

@injectable
class AirQualityLocalDatasource {
  final SharedPreferencesService _preferencesService;

  AirQualityLocalDatasource(this._preferencesService);

  Future<void> saveFavourites(List<int> ids) async {
    final list = ids.map((e) => jsonEncode(jsonDecode("$e"))).toList();
    await _preferencesService.writeList(key: 'ids_key_', value: list);
  }
}
