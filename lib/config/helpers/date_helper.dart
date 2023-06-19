import 'package:intl/intl.dart';

String getDate([DateTime? currentDate]) {
  DateFormat formatter = DateFormat('dd MMMM yyyy');
  String formattedDate = formatter.format(currentDate ?? DateTime.now());
  return formattedDate;
}

String getDateRange(DateTime startDate, DateTime endDate) {
  final dateFormatter = DateFormat.MMM();
  final formattedStartDate = startDate.day.toString();
  final formattedEndDate = endDate.day.toString();
  final formattedStartMonth = dateFormatter.format(startDate);
  final formattedEndMonth = dateFormatter.format(endDate);
  final startMonth = startDate.month;
  final endMonth = endDate.month;

  if (startMonth == endMonth) {
    return '$formattedStartDate - $formattedEndDate $formattedStartMonth ${startDate.year}';
  } else {
    return '$formattedStartDate $formattedStartMonth - $formattedEndDate $formattedEndMonth ${startDate.year}';
  }
}
