part of 'rank_cubit.dart';

@freezed
class RankState with _$RankState {
  const factory RankState({
    required bool loading,
    required RankFilter selectedFilter,
    required List<MapData?> mapData,
    required List<City?> cities,
    required Option<Either<AQFailure, List<City?>>> option,
  }) = _RankState;

  factory RankState.initial() {
    return RankState(
      loading: false,
      selectedFilter: RankFilter.top10,
      cities: [],
      mapData: [],
      option: none(),
    );
  }
}
