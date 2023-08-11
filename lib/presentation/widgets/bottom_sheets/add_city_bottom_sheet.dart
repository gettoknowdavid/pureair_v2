import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/pages/loader.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

class AddCityBottomSheet extends StatelessWidget {
  const AddCityBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final viewInsets = MediaQuery.viewInsetsOf(context);

    final textTheme = Theme.of(context).textTheme;

    final cubit = context.watch<SearchCubit>();

    return Container(
      constraints: BoxConstraints(maxHeight: height * 0.83),
      padding: EdgeInsets.only(bottom: viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: kHorizontalPadding18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Add another city',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (!cubit.state.loading)
                  Text(
                    "${cubit.state.displayedResult.length} item(s)",
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: textTheme.bodyMedium?.color?.withOpacity(0.8),
                    ),
                  ),
              ],
            ),
          ),
          14.verticalSpace,
          BlocBuilder<SearchCubit, SearchState>(
            bloc: cubit,
            buildWhen: (p, c) => p.keyword != c.keyword,
            builder: (context, state) => Column(
              children: [
                Padding(
                  padding: kHorizontalPadding18,
                  child: AppTextField(
                    hint: 'Search city',
                    key: const Key(AppKeys.searchKeywordInput),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: cubit.keywordChanged,
                    prefixIcon: Icon(PhosphorIcons.regular.magnifyingGlass),
                  ),
                ),
                if (cubit.state.loading)
                  SizedBox(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width,
                    child: const Loader(),
                  )
                else
                  20.verticalSpace,
              ],
            ),
          ),
          const Expanded(child: SearchResultList()),
        ],
      ),
    );
  }
}

// class _ChipList extends StatelessWidget {
//   const _ChipList();

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;
//     final textTheme = theme.textTheme;

//     return ListView.separated(
//       padding: kHorizontalPadding18,
//       itemCount: _locations.length,
//       separatorBuilder: (context, index) => 14.horizontalSpace,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) => OutlinedButton(
//         onPressed: () {},
//         style: OutlinedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           backgroundColor: index == 0 ? colorScheme.tertiary : null,
//           foregroundColor: index == 0 ? colorScheme.onTertiary : null,
//           textStyle: textTheme.labelMedium,
//         ),
//         child: Text(_locations[index]),
//       ),
//     );
//   }
// }

// final _locations = [
//   "Trending",
//   "Lagos",
//   "Abuja",
//   "Bali",
//   "Port Harcourt",
//   "Chicago",
//   "Beijing"
// ];