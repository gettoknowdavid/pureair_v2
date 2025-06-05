import 'package:injectable/injectable.dart';

@lazySingleton
final class AirQualityLocalDatasource {
  AirQualityLocalDatasource();

  // void addCity(City city) => _objectbox.cityBox.put(city);

  // void clearSavedCities() => _objectbox.cityBox.removeAll();

  // List<City?> getCities() {
  //   final builder = _objectbox.cityBox.query().order(City_.addedTime);
  //   return builder.build().find();
  // }

  // Stream<List<City?>> getCitiesStream() {
  //   final builder = _objectbox.cityBox.query().order(City_.addedTime);
  //   return builder.watch(triggerImmediately: true).map((query) => 
  //   query.find());
  // }

  // City? getLocal(String uid) {
  //   final builder = _objectbox.cityBox.query(City_.uid.equals(uid));
  //   return builder.build().findFirst();
  // }

  // void removeCity(City city) {
  //   final uid = city.geo!.toList().generateCityUid;
  //   _objectbox.cityBox.query(City_.uid.equals(uid)).build().remove();
  // }
}
