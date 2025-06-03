import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/exceptions/pure_air_exception.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart' show SingleLineString;
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required AirQualityRepository repository,
  })  : _repository = repository,
        super(SearchState(keyword: SingleLineString(''))) {
    on<SearchKeywordChanged>(
      _onSearchKeywordChanged,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 350))
          .switchMap(mapper),
    );
  }

  final AirQualityRepository _repository;

  Future<void> _onSearchKeywordChanged(
    SearchKeywordChanged event,
    Emitter<SearchState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SearchStatus.loading,
        keyword: SingleLineString(event.keyword),
      ),
    );
    final failureOrSuccess = await _repository.search(state.keyword);
    emit(
      failureOrSuccess.fold(
        (exception) => state.copyWith(
          status: SearchStatus.failure,
          exception: exception,
        ),
        (results) => state.copyWith(
          status: SearchStatus.success,
          results: results,
        ),
      ),
    );
  }
}
