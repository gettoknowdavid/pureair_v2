import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class AddCitySheetWidget extends ConsumerWidget {
  const AddCitySheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          const SearchBarWidget(),
          const SearchLoadingIndicatorWidget(),
          const Expanded(child: SearchResultsWidget()),
        ],
      ),
    );
  }
}

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(searchBarNotifierProvider.notifier);
    return Padding(
      padding: kHorizontalPadding24,
      child: SearchBar(
        hintText: 'Search city',
        leading: const Icon(PhosphorIconsRegular.magnifyingGlass),
        onChanged: notifier.onChanged,
      ),
    );
  }
}

class SearchLoadingIndicatorWidget extends ConsumerWidget {
  const SearchLoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(searchNotifierProvider);
    return result.maybeWhen(
      orElse: () => const SizedBox(),
      loading: LoadingIndicator.new,
    );
  }
}
