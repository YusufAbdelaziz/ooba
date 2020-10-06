import 'package:Ooba/pages/address/my_address_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../utilities/space.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/common/custom_button.dart';
import 'order_placed_page.dart';

class OrderDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).translate('OrderDetails.orderDetails'),
        backAction: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).translate('OrderDetails.orderDetails').toUpperCase(),
              style: Theme.of(context).textTheme.headline4,
            ),
            space(height: 10),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                separatorBuilder: (context, i) => space(height: 8),
                itemBuilder: (context, i) => Row(
                      children: [
                        Image.asset(
                          'assets/images/vendor_logo.png',
                          height: 60,
                          width: 60,
                        ),
                        space(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Rolex Oyster Perputal Watch'),
                            space(height: 10),
                            Text(
                              '\$259',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                          ],
                        )
                      ],
                    )),
            space(height: 20),
            Divider(
              thickness: 1,
              height: 1,
              color: Theme.of(context).primaryColor,
            ),
            space(height: 15),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)
                          .translate('OrderDetails.deliverTo')
                          .toUpperCase(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                          PageTransition(type: PageTransitionType.fade, child: MyAddressPage())),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 8),
                        child: Text(
                          AppLocalizations.of(context).translate('OrderDetails.change'),
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                space(height: 10),
                Text(
                  'Kings Street 20, Southfield, Michingan (MI), 48075',
                  maxLines: 3,
                  style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.black),
                ),
                space(height: 20),
                Divider(
                  thickness: 1,
                  height: 1,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            space(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)
                      .translate('OrderDetails.shippingMethod')
                      .toUpperCase(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                space(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 15),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Radio<String>(
                          onChanged: (value) {},
                          value: 'Standard Shipping',
                          groupValue: 'Standard Shipping',
                          activeColor: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Text('Standard Shipping (16 Days)'),
                    Spacer(),
                    Text(
                      AppLocalizations.of(context).translate('OrderDetails.free'),
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                space(height: 20),
                Divider(
                  thickness: 1,
                  height: 1,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            space(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate('OrderDetails.subtotal').toUpperCase(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text('\$768.00', style: Theme.of(context).textTheme.headline2)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate('OrderDetails.shipping').toUpperCase(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text('\$4.00', style: Theme.of(context).textTheme.headline2)
              ],
            ),
            space(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate('OrderDetails.total'),
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Text('\$772.00',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w300))
              ],
            ),
            space(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomButton(
                onTap: () => Navigator.of(context)
                    .push(PageTransition(child: OrderPlacedPage(), type: PageTransitionType.fade)),
                color: Theme.of(context).primaryColor,
                label: AppLocalizations.of(context).translate('OrderDetails.placeTheOrder'),
              ),
            ),
            space(height: 10),
          ],
        ),
      ),
    );
  }
}
