import 'package:flutter/material.dart';

import '../../common/translation_configuration/app_localizations.dart';

class CustomSnackBar {
  static void showSnackBar({
    @required BuildContext context,
    @required String textMsg,
  }) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(textMsg),
      action: SnackBarAction(
          textColor: Theme.of(context).primaryColor,
          label: AppLocalizations.of(context).translate('close'),
          onPressed: () => Scaffold.of(context).hideCurrentSnackBar()),
    ));
  }
}
