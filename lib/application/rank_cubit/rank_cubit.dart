import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flag/flag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/services/location_service.dart';

part 'rank_cubit.freezed.dart';
part 'rank_state.dart';

const latLng = "-90,-180,90,180";

@injectable
class RankCubit extends Cubit<RankState> {
  final IAirQualityFacade facade;
  final LocationService locationService;
  RankCubit(this.facade, this.locationService) : super(RankState.initial());

  void applyFilter(RankFilter filter) {
    emit(state.copyWith(selectedFilter: filter, loading: true));
    final filteredCities = filter.apply(state.mapData);
    emit(state.copyWith(cities: filteredCities, loading: false));
  }

  Future<Flag> getFlag(List<double> geo) async {
    return await locationService.getFlag(geo);
  }

  Future<void> initialized() async {
    emit(state.copyWith(loading: true));
    final result = await _getMapData();
    final filteredList = RankFilter.worst.apply(result);
    emit(state.copyWith(loading: false, cities: filteredList));
  }

  Future<void> reload() async {
    emit(state.copyWith(loading: true));
    final result = await _getMapData();
    final filteredCities = state.selectedFilter.apply(result);
    emit(state.copyWith(cities: filteredCities, loading: false));
  }

  Future<List<MapData?>> _getMapData() async {
    final result = await facade.stationsOnMap(latLng);
    final rawList = result.getOrElse(() => []);
    final cleanList = rawList.where((e) => e?.aqi != '-').toList();
    emit(state.copyWith(mapData: cleanList));
    return cleanList;
  }
}

enum RankFilter {
  top10,
  bottom10,
  top100,
  bottom100,
  best,
  worst,
}

extension RankFilterExtension on RankFilter {
  List<City?> apply(List<MapData?> data) {
    List<MapData?> list = List.from(data);

    switch (this) {
      case RankFilter.worst:
        list.sort((a, b) => int.parse(b!.aqi).compareTo(int.parse(a!.aqi)));
        list = list.sublist(0, 20);
        break;
      case RankFilter.best:
        list.sort((a, b) => int.parse(a!.aqi).compareTo(int.parse(b!.aqi)));
        list = list.sublist(0, 20);
        break;
      case RankFilter.top100:
        list.sort((a, b) => int.parse(a!.aqi).compareTo(int.parse(b!.aqi)));
        list = list.sublist(0, 50);
        break;
      case RankFilter.bottom100:
        list.sort((a, b) => int.parse(b!.aqi).compareTo(int.parse(a!.aqi)));
        list = list.sublist(0, 50);
        break;
      case RankFilter.top10:
        list.sort((a, b) => int.parse(a!.aqi).compareTo(int.parse(b!.aqi)));
        list = list.sublist(0, 10);
        break;
      case RankFilter.bottom10:
        list.sort((a, b) => int.parse(b!.aqi).compareTo(int.parse(a!.aqi)));
        list = list.sublist(0, 10);
        break;
    }

    return list.map((e) {
      return City(
        name: e!.station.name,
        aqi: int.tryParse(e.aqi),
        geo: [e.lat, e.lon],
        uid: e.uid.toString(),
      );
    }).toList();
  }

  String toName() {
    switch (this) {
      case RankFilter.best:
        return 'Best Cities';
      case RankFilter.bottom100:
        return 'Bottom 50';
      case RankFilter.top100:
        return 'Top 50';
      case RankFilter.top10:
        return 'Top 10';
      case RankFilter.bottom10:
        return 'Bottom 10';
      case RankFilter.worst:
        return 'Worst Cities';
      default:
        return '';
    }
  }
}
