import 'package:equatable/equatable.dart';

final class PureAirException with EquatableMixin implements Exception {
  const PureAirException(this.message);
  final String message;

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}

final class PureAirNetworkException extends PureAirException {
  const PureAirNetworkException([super.message = 'Network exception']);
}

final class PureAirServerException extends PureAirException {
  const PureAirServerException([super.message = 'Server exception']);
}

final class PureAirTimeoutException extends PureAirException {
  const PureAirTimeoutException([super.message = 'Request timed out.']);
}

final class PureAirQualityUnavailable extends PureAirException {
  const PureAirQualityUnavailable([
    super.message =
        'Air quality could not be retrieved at the moment. Please, try again.',
  ]);
}

final class PureAirUnknownException extends PureAirException {
  const PureAirUnknownException([super.message = 'Unknown exception']);
}
