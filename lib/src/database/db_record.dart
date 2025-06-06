import 'package:cv/cv.dart';
import 'package:pureair_v2/src/database/database_constants.dart';

abstract class DbRecord extends CvModelBase {
  final id = CvField<int>(columnId);
}
