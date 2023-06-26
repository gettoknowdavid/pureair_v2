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

  void addLocal(CityDto city) {
    _objectBox.localBox.put(city);
  }

  void clearSavedCities() => _objectBox.cityBox.removeAll();

  List<CityDto?> getCities() {
    final builder = _objectBox.cityBox.query().order(CityDto_.addedTime);
    return builder.build().find();
  }

  Stream<List<CityDto?>> getCitiesStream() {
    final builder = _objectBox.cityBox.query().order(CityDto_.addedTime);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  CityDto? getLocal(String uid) {
    final builder = _objectBox.cityBox.query(CityDto_.uid.equals(uid));
    return builder.build().findFirst();
  }

  void removeCity(CityDto city) {
    _objectBox.cityBox.query(CityDto_.uid.equals(city.uid!)).build().remove();
  }
}
