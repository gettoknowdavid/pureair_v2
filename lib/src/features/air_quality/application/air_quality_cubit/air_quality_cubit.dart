import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/utils.dart';
import '../../domain/entities/entities.dart';
import '../../domain/errors/aq_failure.dart';
import '../../domain/i_air_quality_facade.dart';

part 'air_quality_cubit.freezed.dart';
part 'air_quality_state.dart';

@injectable
class AirQualityCubit extends Cubit<AirQualityState> {
  final IAirQualityFacade _facade;
  AirQualityCubit(this._facade) : super(AirQualityState.initial());

  Future<void> addCity(City city) async {
    emit(state.copyWith(citiesLoading: true));

    final uid = generateUUIDFromGeo(city.geo!);
    await _facade.addCity(city.copyWith(uid: uid, addedTime: DateTime.now()));
    final cities = await _facade.getAllCityData();

    emit(state.copyWith(citiesLoading: false, citiesOption: some(cities)));
  }

  Future clearSavedCities() async {
    _facade.clearSavedCities();
    final cities = await _facade.getAllCityData();

    emit(state.copyWith(citiesLoading: false, citiesOption: some(cities)));
  }

  Future initialized() async {
    emit(state.copyWith(citiesLoading: true, localLoading: true));

    final local = await _facade.getLocal();
    final cities = await _facade.getAllCityData();

    emit(state.copyWith(
      citiesLoading: false,
      localLoading: false,
      citiesOption: some(cities),
      localOption: some(local),
    ));
  }

  Future refresh() async {
    emit(state.copyWith(citiesLoading: true, localLoading: true));

    final local = await _facade.getLocal();
    final cities = await _facade.getAllCityData();

    emit(state.copyWith(
      citiesLoading: false,
      localLoading: false,
      citiesOption: some(cities),
      localOption: some(local),
    ));
  }

  Future<void> removeCity(City city) async {
    await _facade.removeCity(city);
    final cities = await _facade.getAllCityData();

    emit(state.copyWith(citiesLoading: false, citiesOption: some(cities)));
  }
}
