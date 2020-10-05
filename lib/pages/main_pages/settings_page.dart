import 'package:flutter/material.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/main_product_pages/settings_item.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).translate('Drawer.settings'),
        backAction: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SettingsItem(
                  header: AppLocalizations.of(context).translate('Settings.myProfile'),
                  action: null,
                  title: 'Ahmed@gmail.com'),
              SettingsItem(
                  header: AppLocalizations.of(context).translate('Settings.currency'),
                  action: null,
                  title: 'Kuwaiti Dinar'),
              SettingsItem(
                  header: AppLocalizations.of(context).translate('Settings.language'),
                  action: null,
                  title: AppLocalizations.of(context).locale.languageCode == 'ar'
                      ? 'العربية'
                      : "English"),
              SettingsItem(
                  header: AppLocalizations.of(context).translate('Settings.address'),
                  action: null,
                  title: 'London, UK')
            ],
          )),
    );
  }
}
