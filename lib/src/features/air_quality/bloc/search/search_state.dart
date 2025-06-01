part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, failure }

class SearchState with EquatableMixin {
  SearchState({
    required this.keyword,
    this.results = const <SearchData?>[],
    this.status = SearchStatus.initial,
    this.exception,
  });

  final SingleLineString keyword;
  final SearchStatus status;
  final List<SearchData?> results;
  final PureAirException? exception;

  SearchState copyWith({
    SingleLineString? keyword,
    SearchStatus? status,
    List<SearchData?>? results,
    PureAirException? exception,
  }) {
    return SearchState(
      keyword: keyword ?? this.keyword,
      status: status ?? this.status,
      results: results ?? this.results,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [keyword, status, results, exception];
}
