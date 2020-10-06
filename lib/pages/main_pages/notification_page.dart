import 'package:Ooba/utilities/space.dart';
import 'package:flutter/material.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../widgets/common/custom_appbar.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).translate('Drawer.notification'),
        backAction: () => Navigator.of(context).pop(),
      ),
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          itemBuilder: (context, i) => Stack(
                children: [
                  Image.asset('assets/images/voucher.png'),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rolex Discount',
                                style: Theme.of(context).textTheme.headline2.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w400, height: 1.2),
                              ),
                              space(height: 5),
                              Text(
                                'Valid until February 2020',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(fontWeight: FontWeight.w300, height: 1.2),
                              )
                            ],
                          ),
                          Spacer(),
                          Text('50%',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: Theme.of(context).primaryColor, height: 1.2))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          separatorBuilder: (__, _) => space(height: 10),
          itemCount: 5),
    );
  }
}
