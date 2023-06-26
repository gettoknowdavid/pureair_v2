import 'package:uuid/uuid.dart';

String generateUUIDFromGeo(List<double> geo) {
  final double lat = geo[0];
  final double lon = geo[1];

  final String formattedLatitude = lat.toStringAsFixed(6);
  final String formattedLongitude = lon.toStringAsFixed(6);

  final String concatenatedValues = '$formattedLatitude|$formattedLongitude';

  final uuid = const Uuid().v5(Uuid.NAMESPACE_OID, concatenatedValues);

  return uuid;
}

// int generateUUIDFromGeo(List<double> geo) {
//   final double lat = geo[0];
//   final double lon = geo[1];

//   final String formattedLatitude = lat.toStringAsFixed(6);
//   final String formattedLongitude = lon.toStringAsFixed(6);

//   final String concatenatedValues = '$formattedLatitude|$formattedLongitude';

//   final int hashCode = concatenatedValues.hashCode.abs();

//   return hashCode;
// }
