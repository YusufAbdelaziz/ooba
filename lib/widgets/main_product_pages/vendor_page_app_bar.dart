import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../pages/main_pages/order_details_page.dart';
import '../../utilities/space.dart';
import '../../widgets/common/vendor_tile.dart';

class VendorPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kToolbarHeight - 30,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                icon: Image.asset(
                  'assets/images/cart.png',
                  width: 20,
                  height: 20,
                ),
                onPressed: () => Navigator.of(context)
                    .push(PageTransition(type: PageTransitionType.fade, child: OrderDetailsPage())),
              ),
            ],
          ),
          VendorTile(),
          space(height: 5),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => print('follow !'),
            child: Container(
                width: 77,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  AppLocalizations.of(context).translate('VendorProducts.follow'),
                  style: Theme.of(context).textTheme.headline5,
                )),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 190);
}
