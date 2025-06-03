part of 'details_cubit.dart';

sealed class DetailsState with EquatableMixin {
  const DetailsState();

  @override
  List<Object?> get props => [];
}

final class DetailsLoadInProgress extends DetailsState {
  const DetailsLoadInProgress();
}

final class DetailsLoadSuccess extends DetailsState {
  const DetailsLoadSuccess(this.airQuality);
  final AirQuality airQuality;

  @override
  List<Object?> get props => [airQuality];
}

final class DetailsLoadFailure extends DetailsState {
  const DetailsLoadFailure(this.exception);
  final PureAirException exception;

  @override
  List<Object?> get props => [exception];
}
