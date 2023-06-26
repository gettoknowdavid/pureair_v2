import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/infrastructure/dtos/air_quality/city_dto.dart';

import '../objectbox.g.dart';

class ObjectBoxService {
  late final Store store;

  late final Box<CityDto> cityBox;
  late final Box<CityDto> localBox;

  ObjectBoxService._create(this.store) {
    cityBox = Box<CityDto>(store);
    localBox = Box<CityDto>(store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBoxService> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, AppKeys.db));
    return ObjectBoxService._create(store);
  }
}
