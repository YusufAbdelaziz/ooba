import 'package:Ooba/common/translation_configuration/app_localizations.dart';
import 'package:Ooba/model/address.dart';
import 'package:Ooba/widgets/address/address_card.dart';
import 'package:Ooba/widgets/common/custom_appbar.dart';
import 'package:flutter/material.dart';

class MyAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).translate('Address.myAddresses'),
        backAction: () => Navigator.of(context).pop(),
      ),
      body: ListView.separated(
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
          separatorBuilder: (BuildContext context, int index) => Divider(indent: 20,endIndent: 20,),
          itemCount: 3),
    );
  }
}
