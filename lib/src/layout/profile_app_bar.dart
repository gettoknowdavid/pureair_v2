import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/constants/constants.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;

    return AppBar(
      // title: Text(
      //   'David Michael',
      //   style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      // ),
      actions: [
        InkWell(
          onTap: () {},
          child: PhosphorIcon(PhosphorIcons.regular.nut),
        ),
        14.horizontalSpace,
      ],
    );
  }
}
