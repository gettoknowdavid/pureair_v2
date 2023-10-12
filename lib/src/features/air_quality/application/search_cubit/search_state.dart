part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required bool loading,
    required String keyword,
    required List<SearchData?> result,
    required List<SearchData?> displayedResult,
    required int displayedItems,
    required Option<Either<AQFailure, List<SearchData?>>> option,
    required Option<Either<AQFailure, AirQuality?>> detailsOption,
  }) = _SearchState;

  factory SearchState.initial() {
    return SearchState(
      loading: false,
      keyword: '',
      result: [],
      displayedResult: [],
      displayedItems: 5,
      option: none(),
      detailsOption: none(),
    );
  }
}
