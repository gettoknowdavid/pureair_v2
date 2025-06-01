import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pureair_v2/objectbox.g.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart' show City;
import 'package:riverpod_annotation/riverpod_annotation.dart';

final objectboxProvider = Provider<Objectbox>(
  (ref) => throw UnimplementedError(),
);

class Objectbox {
  Objectbox._create(this._store) {
    _cityBox = Box<City>(_store);
  }

  /// The Store of this app.
  late final Store _store;

  /// A Box of cities.
  late final Box<City> _cityBox;
  Box<City> get cityBox => _cityBox;

  /// Create an instance of Objectbox to use throughout the app.
  static Future<Objectbox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, 'pureair'));
    return Objectbox._create(store);
  }
}
