import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../models/address.dart';
import '../../pages/address/add_address_page.dart';
import '../../utilities/space.dart';
import '../../widgets/address/address_card.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/common/custom_button.dart';

class MyAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).translate('Address.myAddresses'),
        backAction: () => Navigator.of(context).pop(),
      ),
      body: Column(
        children: [
          ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return AddressCard(
                  address: AddressModel(
                      name: "HOME ADDRESS",
                      addressLine1: "Kings Street 20,",
                      city: "Minia",
                      country: "Egypt",
                      zipCode: "61111"),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                  ),
              itemCount: 3),
          space(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              label: AppLocalizations.of(context).translate('Address.addNewAddress'),
              color: Theme.of(context).primaryColor,
              onTap: () => Navigator.of(context)
                  .push(PageTransition(child: AddAddressPage(), type: PageTransitionType.fade)),
            ),
          )
        ],
      ),
    );
  }
}
