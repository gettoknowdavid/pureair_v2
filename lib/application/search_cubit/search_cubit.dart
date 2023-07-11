import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/domain.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final IAirQualityFacade _facade;
  SearchCubit(this._facade) : super(SearchState.initial());

  // Update the keyword value in SearchState
  Future<List<SearchData?>> keywordChanged(String keyword) async {
    emit(state.copyWith(loading: true, displayedItems: 5));

    Either<AQError, List<SearchData?>> r;

    r = await _facade.search(keyword);

    emit(
      state.copyWith(
        keyword: keyword,
        loading: false,
        result: r.getOrElse(() => []),
        option: some(r),
        displayedResult: state.result.take(state.displayedItems).toList(),
      ),
    );

    return state.result;
  }

  Future<void> loadMore() async {
    if (!state.loading) {
      int items = state.displayedItems;
      emit(state.copyWith(loading: true, displayedItems: items += 5));

      Future.delayed(const Duration(seconds: 1), () {
        emit(state.copyWith(
          loading: false,
          displayedResult: state.result.take(state.displayedItems).toList(),
        ));
      });
    }
  }

  Future<AirQuality?> loadDetails(List<double> geo) async {
    if (!state.loading) {
      emit(state.copyWith(loading: true, detailsOption: none()));

      final result = await _facade.getByGeo(geo[0], geo[1]);

      emit(state.copyWith(loading: false, detailsOption: some(result)));

      return result.getOrElse(() => null);
    }

    return null;
  }
}
