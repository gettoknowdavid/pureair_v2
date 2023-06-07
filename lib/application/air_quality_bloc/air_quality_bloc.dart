import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/domain.dart';

part 'air_quality_bloc.freezed.dart';
part 'air_quality_event.dart';
part 'air_quality_state.dart';

@injectable
class AirQualityBloc extends Bloc<AirQualityEvent, AirQualityState> {
  final IAirQualityFacade _facade;
  AirQualityBloc(this._facade) : super(AirQualityState.initial()) {
    on<_IPAddressAQIRequested>(_ipAddressAQIRequested);
  }

  _ipAddressAQIRequested(
    _IPAddressAQIRequested event,
    Emitter<AirQualityState> emit,
  ) async {
    Either<AqiError, AirQuality> r;

    emit(state.copyWith(loading: true, ipAddressAQIOption: none()));

    r = await _facade.getByIPAddress();

    emit(state.copyWith(loading: false, ipAddressAQIOption: some(r)));
  }
}
