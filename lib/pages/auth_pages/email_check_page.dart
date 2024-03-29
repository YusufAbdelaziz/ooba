import 'package:flutter/material.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../utilities/space.dart';
import '../../widgets/auth_pages/custom_auth_header.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/common/custom_button.dart';

class EmailCheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).translate('EmailCheck.checkYourEmail'),
        backAction: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/send_group.png',
              height: 120,
              width: 120,
            ),
            space(height: 40),
            CustomAuthHeader(
              title: AppLocalizations.of(context).translate('EmailCheck.checkYourEmail'),
              subTitle: AppLocalizations.of(context).translate('EmailCheck.instructions'),
            ),
            space(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  CustomButton(
                    onTap: () {},
                    color: Theme.of(context).primaryColor,
                    content: Text(
                      AppLocalizations.of(context).translate('EmailCheck.openMyMail'),
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  CustomButton(
                    onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
                    color: Theme.of(context).primaryColor,
                    content: Text(
                      AppLocalizations.of(context).translate('EmailCheck.returnToSignIn'),
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
