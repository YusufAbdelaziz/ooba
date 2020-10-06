import 'package:flutter/material.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../utilities/space.dart';

typedef void CustomAction();

class SettingsItem extends StatelessWidget {
  final String header;
  final CustomAction action;
  final String title;
  const SettingsItem({@required this.header, @required this.action, @required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        space(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              header.toUpperCase(),
              style: Theme.of(context).textTheme.headline4,
            ),
            InkWell(
              onTap: action,
              child: Text(AppLocalizations.of(context).translate('Settings.change'),
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(color: Theme.of(context).primaryColor)),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            )
          ],
        ),
        space(height: 10),
        Text(title,
            style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.w400)),
        space(height: 20),
        Divider(
          height: 1,
          thickness: 1,
        )
      ],
    );
  }
}
