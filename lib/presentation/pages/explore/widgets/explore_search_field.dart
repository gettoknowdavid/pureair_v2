import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/constants/app_keys.dart';
import 'package:pureair_v2/presentation/widgets/app_text_field.dart';

class ExploreSearchField extends StatelessWidget {
  const ExploreSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: AppTextField(
        hint: 'Search city',
        key: const Key(AppKeys.searchMapInput),
        keyboardType: TextInputType.streetAddress,
        autofocus: false,
        onChanged: (value) {},
        fillColor: colorScheme.background,
        prefixIcon: Icon(PhosphorIcons.regular.magnifyingGlass),
      ),
    );
  }
}
