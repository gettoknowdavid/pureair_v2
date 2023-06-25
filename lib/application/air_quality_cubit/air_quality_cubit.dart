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

  Future<void> addCity(City city) async {
    emit(state.copyWith(loading: true));

    await _facade.addCity(city);
    final cities = await _facade.getAllCityData();

    emit(state.copyWith(loading: false, citiesOption: some(cities)));
  }

  Future initialized() async {
    emit(state.copyWith(loading: true));

    await _facade.getLocal();
    final cities = await _facade.getAllCityData();

    emit(state.copyWith(loading: false, citiesOption: some(cities)));
  }

  Future refresh() async {
    emit(state.copyWith(loading: true));

    final cities = await _facade.getAllCityData();

    emit(state.copyWith(loading: false, citiesOption: some(cities)));
  }

  Future clearSavedCities() async {
    emit(state.copyWith(loading: true));

    await _facade.clearSavedCities();
    await _facade.getLocal();
    final cities = await _facade.getAllCityData();

    emit(state.copyWith(loading: false, citiesOption: some(cities)));
  }

  Future<void> removeCity(City city) async {
    emit(state.copyWith(loading: true));

    await _facade.removeCity(city);
    final cities = await _facade.getAllCityData();

    emit(state.copyWith(loading: false, citiesOption: some(cities)));
  }
}
