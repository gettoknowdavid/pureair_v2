import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_notifier.g.dart';

@riverpod
class SearchBarNotifier extends _$SearchBarNotifier {
  @override
  SingleLineString build() => SingleLineString('');

  void onChanged(String value) {
    state = SingleLineString(value);
    ref.read(searchNotifierProvider.notifier).search();
  }
}

@riverpod
FutureOr<List<SearchData?>> search(Ref ref) async {
  final keyword = ref.watch(searchBarNotifierProvider);
  final result = await ref.read(airQualityFacadeProvider).search(keyword);
  return result.fold((exception) => throw exception, (data) => data);
}

@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  FutureOr<List<SearchData?>> build() async => [];

  Future<void> search() async {
    state = const AsyncLoading();
    final keyword = ref.watch(searchBarNotifierProvider);
    final result = await ref.read(airQualityFacadeProvider).search(keyword);
    state = result.fold(
      (exception) => AsyncError(exception, StackTrace.current),
      AsyncData.new,
    );
  }
}
