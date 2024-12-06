import 'package:intl/intl.dart';

/// Formats a given [date] to 'dd MMMM yyyy'. Defaults to the current date.
String getDate([DateTime? date]) {
  final formatter = DateFormat('dd MMMM yyyy');
  return formatter.format(date ?? DateTime.now());
}

/// Returns a date range string in the format:
/// - If the months are the same: "startDay - endDay Month Year"
/// - If the months differ: "startDay StartMonth - endDay EndMonth Year"
String getDateRange(DateTime startDate, DateTime endDate) {
  final dayFormatter = DateFormat.d(); // Day only
  final monthFormatter = DateFormat.MMM(); // Short month name
  final yearFormatter = DateFormat.y(); // Year

  final startDay = dayFormatter.format(startDate);
  final endDay = dayFormatter.format(endDate);
  final startMonth = monthFormatter.format(startDate);
  final endMonth = monthFormatter.format(endDate);
  final year = yearFormatter.format(startDate);

  return startDate.month == endDate.month
      ? '$startDay - $endDay $startMonth $year'
      : '$startDay $startMonth - $endDay $endMonth $year';
}
