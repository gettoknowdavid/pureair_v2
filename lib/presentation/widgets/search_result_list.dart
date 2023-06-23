import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/constants/constants.dart';

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
      _loadMoreResults();
    }
  }

  Future<void> _loadMoreResults() async {
    await context.read<SearchCubit>().loadMore();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SearchCubit>();

    return BlocConsumer<SearchCubit, SearchState>(
      bloc: cubit,
      listenWhen: (p, c) => p.keyword != c.keyword,
      listener: (context, state) {},
      builder: (context, state) {
        Logger().wtf(state);

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
              return _buildLoadMoreButton(context);
            }
          },
        );
      },
    );
  }

  Widget _buildLoadMoreButton(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    return TextButton(
      onPressed: _loadMoreResults,
      style: TextButton.styleFrom(
        textStyle: textStyle?.copyWith(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
      child: const Text('Load more...'),
    );
  }
}
