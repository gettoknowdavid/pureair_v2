import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class AddCityBottomSheet extends StatelessWidget {
  const AddCityBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => SearchBloc(repository: ctx.read<AirQualityRepository>()),
      child: const AddCityBottomSheetWidget(),
    );
  }
}

class AddCityBottomSheetWidget extends StatelessWidget {
  const AddCityBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final viewInsets = MediaQuery.viewInsetsOf(context);

    final textTheme = PureAirTextTheme.of(context)!;

    return Container(
      constraints: BoxConstraints(
        maxHeight: height * 0.83,
        minWidth: double.infinity,
      ),
      padding: EdgeInsets.only(bottom: viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: kHorizontalPadding24,
            child: Text('Add another city', style: textTheme.titleBold),
          ),
          const SizedBox(height: 14),
          const AddCitySearchBarWidget(),
          const SearchLoadingIndicatorWidget(),
          const Expanded(child: SearchResultsWidget()),
        ],
      ),
    );
  }
}

class AddCitySearchBarWidget extends StatelessWidget {
  const AddCitySearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchBloc>();
    return PSearchBar(
      onChanged: (value) => bloc.add(
        SearchKeywordChanged(value),
      ),
    );
  }
}

class SearchLoadingIndicatorWidget extends StatelessWidget {
  const SearchLoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SearchBloc, SearchState, SearchStatus>(
      selector: (state) => state.status,
      builder: (context, status) => switch (status) {
        SearchStatus.loading => const LoadingIndicator(),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
