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
    on<_Initialized>(_initialized);
  }

  _initialized(_Initialized event, Emitter<AirQualityState> emit) async {
    final currentAQIResult = await _facade.getCurrent(4.8472, 6.9746);

    emit(state.copyWith(loading: true, currentAQIOption: none()));

    emit(
      state.copyWith(
        loading: false,
        airQualityList: [currentAQIResult.getOrElse(() => AirQuality.empty())],
        currentAQIOption: some(currentAQIResult),
      ),
    );
  }
}
