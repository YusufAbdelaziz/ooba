import 'package:Ooba/blocs/address_cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../models/address.dart';

class AddressCard extends StatelessWidget implements PreferredSizeWidget {
  final Address address;

  const AddressCard({@required this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                address.contactName,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontSize: 14, color: Color(0xff676870)),
              ),
              address.isDefault
                  ? Icon(
                      Icons.check,
                      color: Theme.of(context).primaryColor,
                    )
                  : FlatButton(
                      onPressed: () => BlocProvider.of<AddressCubit>(context)
                          .setDefaultAddress(address: address),
                      child: Text(
                        AppLocalizations.of(context).translate('Address.setDefault'),
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontSize: 14, color: Theme.of(context).primaryColor),
                      ),
                    )
            ],
          ),
          Text(
            '''${address.addressLine1}
${address.city}, ${address.country}, ${address.zipCode}''',
            style: Theme.of(context).textTheme.headline2.copyWith(
                  fontSize: 14,
                ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 120);
}
