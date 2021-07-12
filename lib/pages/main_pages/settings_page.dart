import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/main_product_pages/settings_item.dart';
import '../../pages/address/my_address_page.dart';
import '../../blocs/address_cubit/address_cubit.dart';
import '../../repos/user_repo.dart';
import '../../blocs/global_blocs/language/language_bloc.dart';
import '../../common/translation_configuration/shared_preferences_service.dart';

class SettingsPage extends StatelessWidget {
  final _user = UserRepo.getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).translate('Drawer.settings'),
        backAction: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SettingsItem(
                  header: AppLocalizations.of(context).translate('Settings.myProfile'),
                  action: null,
                  title: _user.email),
              SettingsItem(
                  header: AppLocalizations.of(context).translate('Settings.currency'),
                  action: null,
                  title: 'USD'),
              SettingsItem(
                  header: AppLocalizations.of(context).translate('Settings.language'),
                  action: () {
                    if (AppLocalizations.of(context).locale.languageCode == 'en') {
                      BlocProvider.of<LanguageBloc>(context)
                          .add(LanguageSelected(languageCode: Language.AR));
                    } else {
                      BlocProvider.of<LanguageBloc>(context)
                          .add(LanguageSelected(languageCode: Language.EN));
                    }
                  },
                  title: AppLocalizations.of(context).locale.languageCode == 'ar'
                      ? 'العربية'
                      : "English"),
              BlocBuilder<AddressCubit, AddressState>(
                builder: (context, state) {
                  print(
                      'default address at settings page --> ${UserRepo.getUser().defaultAddress}');
                  return SettingsItem(
                      header: AppLocalizations.of(context).translate('Settings.address'),
                      action: () => Navigator.of(context).push(PageTransition(
                          type: PageTransitionType.fade,
                          child: BlocProvider.value(
                              value: BlocProvider.of<AddressCubit>(context),
                              child: MyAddressPage()))),
                      title: UserRepo.getUser().defaultAddress.addressLine1);
                },
              )
            ],
          )),
    );
  }
}
