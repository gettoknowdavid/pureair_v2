import 'package:injectable/injectable.dart';
import 'package:pureair_v2/infrastructure/infrastructure.dart';
import 'package:pureair_v2/objectbox.g.dart';
import 'package:pureair_v2/services/services.dart';

@lazySingleton
class AQLocalDatasource {
  final ObjectBoxService _objectBox;

  AQLocalDatasource(this._objectBox);

  void addCity(CityDto city) {
    _objectBox.cityBox.put(city);
  }

  void clearSavedCities() => _objectBox.cityBox.removeAll();

  Stream<List<CityDto?>> getCitiesStream() {
    // Query for all events ordered by date.
    // https://docs.objectbox.io/queries
    final builder = _objectBox.cityBox.query().order(CityDto_.addedTime);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  List<CityDto?> getCities() {
    // Query for all events ordered by date.
    // https://docs.objectbox.io/queries
    final builder = _objectBox.cityBox.query().order(CityDto_.addedTime);
    return builder.build().find();
  }

  void removeCity(CityDto city) {
    _objectBox.cityBox.query(CityDto_.uid.equals(city.uid!)).build().remove();
  }
}
