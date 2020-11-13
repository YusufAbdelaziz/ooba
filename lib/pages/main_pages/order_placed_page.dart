import 'package:flutter/material.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../utilities/space.dart';
import '../../widgets/common/custom_button.dart';

class OrderPlacedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/smile.png'),
              space(height: 10),
              Text(
                AppLocalizations.of(context).translate('OrderPlaced.congrats'),
                style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w400),
              ),
              space(height: 10),
              Text(
                AppLocalizations.of(context).translate('OrderPlaced.orderPlacedSuccess'),
                style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w300,fontSize: 18),
                textAlign: TextAlign.center,
              ),
              space(height: 15),
              CustomButton(
                color: Theme.of(context).primaryColor,
                content: Text(
                  AppLocalizations.of(context).translate('OrderPlaced.returnToMainPage'),
                  style: Theme.of(context).textTheme.button,
                ),
                onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),

              )
            ],
          ),
        ),
      ),
    );
  }
}
