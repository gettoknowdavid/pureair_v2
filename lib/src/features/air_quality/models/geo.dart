import 'package:equatable/equatable.dart';

const double _epsilon = 0.000001;

class Geo with EquatableMixin {
  const Geo(this.lat, this.lon);

  factory Geo.fromList(List<dynamic> geo) {
    if (geo.length != 2) {
      throw ArgumentError('Invalid geo');
    }

    // Parse to double as JSON might give strings or ints
    return Geo(
      double.parse(geo[0].toString()),
      double.parse(geo[1].toString()),
    );
  }

  final double lat;
  final double lon;

  List<double> toList() => [lat, lon];

  @override
  // EquatableMixin uses the list returned by props to compare objects.
  // We need to provide comparable (epsilon-based) values here.
  // The best way for floats is to normalize them by rounding with an epsilon.
  // Or, if Equatable had a built-in "nearlyEquals" for doubles, you'd use that.
  // Since it doesn't, we effectively round to make them comparable.
  List<Object?> get props => [
        (lat / _epsilon).round(),
        (lon / _epsilon).round(),
      ];
}
