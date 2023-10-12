import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../objectbox.g.dart';
import '../constants/constants.dart';
import '../features/air_quality/infrastructure/dtos/dtos.dart';

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
