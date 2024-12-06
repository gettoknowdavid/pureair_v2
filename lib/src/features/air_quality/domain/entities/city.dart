import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@Freezed(toJson: true, addImplicitFinal: false)
class City with _$City {
  @Entity(realClass: City)
  factory City({
    required String name,
    int? id,
    @Unique() String? uid,
    final List<double>? geo,
    String? url,
    String? location,
    String? country,
    bool? isLocal,
    int? aqi,
    String? flagUrl,
    String? localeName,
    @Property(type: PropertyType.date) DateTime? time,
    @Property(type: PropertyType.date) DateTime? addedTime,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

extension CityGenUidX on List<double> {
  String get generateUuid {
    final formattedLatitude = this[0].toStringAsFixed(6);
    final formattedLongitude = this[1].toStringAsFixed(6);

    final concatenatedValues = '$formattedLatitude|$formattedLongitude';

    final uuid = const Uuid().v5(Namespace.oid.value, concatenatedValues);

    return uuid;
  }
}
