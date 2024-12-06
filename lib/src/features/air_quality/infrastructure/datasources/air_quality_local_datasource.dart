import 'package:pureair_v2/objectbox.g.dart';
import 'package:pureair_v2/src/features/air_quality/domain/entities/city.dart';
import 'package:pureair_v2/src/services/objectbox_service.dart';

class AirQualityLocalDatasource {
  AirQualityLocalDatasource({
    required Objectbox objectbox,
  }) : _objectbox = objectbox;

  final Objectbox _objectbox;

  void addCity(City city) => _objectbox.cityBox.put(city);

  void clearSavedCities() => _objectbox.cityBox.removeAll();

  List<City?> getCities() {
    final builder = _objectbox.cityBox.query().order(City_.addedTime);
    return builder.build().find();
  }

  Stream<List<City?>> getCitiesStream() {
    final builder = _objectbox.cityBox.query().order(City_.addedTime);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  City? getLocal(String uid) {
    final builder = _objectbox.cityBox.query(City_.uid.equals(uid));
    return builder.build().findFirst();
  }

  void removeCity(City city) {
    _objectbox.cityBox.query(City_.uid.equals(city.uid!)).build().remove();
  }
}
