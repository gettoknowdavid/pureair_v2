import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case SearchStatus.initial:
            return const SizedBox.shrink();
          case SearchStatus.failure:
            return Center(child: Text(state.exception!.message));
          case SearchStatus.loading:
            return _SearchResultWidget(fakeSearchList, isLoading: true);
          case SearchStatus.success:
            return _SearchResultWidget(state.results);
        }
      },
    );
  }
}

class _SearchResultWidget extends HookWidget {
  const _SearchResultWidget(this.results, {this.isLoading = false});
  final List<SearchData?> results;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) return const SizedBox();

    final scrollController = useScrollController();
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        itemCount: results.length,
        controller: scrollController,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, i) => SearchResultCard(data: results[i]!),
      ),
    );
  }
}
