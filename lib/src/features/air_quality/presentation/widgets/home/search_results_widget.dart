import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultsWidget extends ConsumerWidget {
  const SearchResultsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(searchNotifierProvider);
    return result.when(
      data: (list) => _SearchResult(list: list),
      error: (error, _) => Center(child: Text(error.toString())),
      loading: () => Skeletonizer(child: _SearchResult(list: fakeSearchList)),
    );
  }
}

class _SearchResult extends HookWidget {
  const _SearchResult({required this.list});
  final List<SearchData?> list;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) return const SizedBox();

    final scrollController = useScrollController();
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      itemCount: list.length,
      controller: scrollController,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) => SearchResultCard(data: list[index]!),
    );
  }
}
