import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/constants/constants.dart';

import '../features/air_quality/application/search_cubit/search_cubit.dart';
import 'search_result_card.dart';

class SearchResultList extends StatefulWidget {
  const SearchResultList({super.key});

  @override
  State<SearchResultList> createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<SearchCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SearchCubit>();

    return BlocBuilder<SearchCubit, SearchState>(
      bloc: cubit,
      buildWhen: (p, c) => p.keyword != c.keyword,
      builder: (context, state) {
        if (cubit.state.result.isEmpty) {
          return const SizedBox();
        }

        final displayedResult = cubit.state.displayedResult;

        return ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          itemCount: cubit.state.displayedResult.length + 1,
          controller: _scrollController,
          separatorBuilder: (context, index) => 20.verticalSpace,
          itemBuilder: (context, index) {
            if (index < displayedResult.length) {
              final data = displayedResult[index]!;
              return SearchResultCard(data: data);
            } else {
              return const _LoadMoreButton();
            }
          },
        );
      },
    );
  }
}

class _LoadMoreButton extends StatelessWidget {
  const _LoadMoreButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<SearchCubit>().loadMore,
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
      ),
      child: const Text('Load more...'),
    );
  }
}
