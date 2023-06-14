import 'package:intl/intl.dart';

String getFormattedDate([DateTime? currentDate]) {
  DateFormat formatter = DateFormat('dd MMMM yyyy');
  String formattedDate = formatter.format(currentDate ?? DateTime.now());
  return formattedDate;
}
