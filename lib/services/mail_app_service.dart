import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';


class MailAppService {
  Future<void> openMailApp(BuildContext context) async {
    final result = await OpenMailApp.openMailApp();

    if (!result.didOpen && !result.canOpen && context.mounted) {
      await showDialog(
        context: context,
        builder: (context) => const NoMailAppDialog(),
      );
    } else if (!result.didOpen && result.canOpen && context.mounted) {
      await showDialog(
        context: context,
        builder: (context) => MailAppDialog(
          content: MailAppPickerDialog(mailApps: result.options),
        ),
      );
    }
  }
}