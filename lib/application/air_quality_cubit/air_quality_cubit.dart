import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/domain.dart';

part 'air_quality_cubit.freezed.dart';
part 'air_quality_state.dart';

@injectable
class AirQualityCubit extends Cubit<AirQualityState> {
  final IAirQualityFacade _facade;
  AirQualityCubit(this._facade) : super(AirQualityState.initial());

  Future initialized() async {
    emit(state.copyWith(loading: true, option: none()));

    final result = await _facade.getLocal();

    final cities = [...state.cities, result.getOrElse(() => null)];

    emit(state.copyWith(
      loading: false,
      cities: cities,
      option: some(result),
    ));
  }

  Future<void> addCity(AirQuality city) async {
    emit(state.copyWith(loading: true, option: none()));

    final result = await _facade.getLocal();

    final cities = [...state.cities, city];

    emit(state.copyWith(
      loading: false,
      cities: cities,
      option: some(result),
    ));
  }
}
