import 'package:flutter/material.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../utilities/space.dart';
import '../../widgets/common/custom_appbar.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).translate('Drawer.orderHistory'),
        backAction: () => Navigator.of(context).pop(),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(15),
        itemCount: 5,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (__, _) => Column(
          children: [
            space(height: 20),
            Divider(
              height: 1,
              thickness: 1,
            ),
            space(height: 20),
          ],
        ),
        itemBuilder: (context, i) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #21412'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  AppLocalizations.of(context).translate('OrderHistory.viewDetails'),
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(color: Theme.of(context).primaryColor),
                )
              ],
            ),
            space(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context).translate('OrderHistory.placedOn') + ':',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    space(height: 10),
                    Text(AppLocalizations.of(context).translate('OrderHistory.amount') + ':',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w500)),
                    space(height: 10),
                    Text(AppLocalizations.of(context).translate('OrderHistory.status') + ':',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w500))
                  ],
                ),
                space(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '23th Of January',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    space(height: 10),
                    Text('\$230.99',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontWeight: FontWeight.w400)),
                    space(height: 10),
                    Text('Delivered',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontWeight: FontWeight.w400))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
