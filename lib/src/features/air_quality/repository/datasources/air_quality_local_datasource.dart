import 'package:injectable/injectable.dart';
import 'package:pureair_v2/src/database/database.dart';
import 'package:pureair_v2/src/features/air_quality/repository/datasources/dtos/dtos.dart';

@lazySingleton
final class AirQualityLocalDatasource {
  const AirQualityLocalDatasource({
    required PureAirDatabase service,
  }) : _service = service;

  final PureAirDatabase _service;

  Future<void> addCity(CityDto city) async {
    city.id.v = await _service.database.insert(tableCities, city.toJson());
  }

  Future<void> clearSavedCities() => _service.database.delete(tableCities);

  Future<List<CityDto?>> getCities() async {
    final list = await _service.database.query(
      tableCities,
      orderBy: '$citiesColAddedTime DESC',
    );
    return DbCities(list);
  }

  // Stream<List<City?>> getCitiesStream() {
  //   final builder = _objectbox.cityBox.query().order(City_.addedTime);
  //   return builder.watch(triggerImmediately: true).map((query) =>
  //   query.find());
  // }

  // City? getLocal(String uid) {
  //   final builder = _objectbox.cityBox.query(City_.uid.equals(uid));
  //   return builder.build().findFirst();
  // }

  Future<void> removeCity(CityDto city) async {
    await _service.database.delete(
      tableCities,
      where: '$citiesColUid = ?',
      whereArgs: <Object?>[city.uid.v],
    );
  }
}
