
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../blocs/address_cubit/address_cubit.dart';
import '../../common/translation_configuration/app_localizations.dart';
import '../../pages/address/add_address_page.dart';
import '../../repos/user_repo.dart';
import '../../utilities/custom_snack_bar.dart';
import '../../utilities/space.dart';
import '../../widgets/address/address_card.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/main_product_pages/custom_loading_indicator.dart';
class MyAddressPage extends StatelessWidget {
  final _user = UserRepo.getUser();
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: CustomAppBar(
          title: AppLocalizations.of(context).translate('Address.myAddresses'),
          backAction: () => Navigator.of(context).pop(),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<AddressCubit, AddressState>(
                listener: (context, state) {
                  if (state is GetAddressesFail) {
                    CustomSnackBar.showSnackBar(context: context, textMsg: state.errorMsg);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingAddresses) {
                    return CustomLoadingIndicator();
                  } else if (state is GetAddressesSuccess) {
                    return RefreshIndicator(
                      onRefresh: () async => BlocProvider.of<AddressCubit>(context)
                          .fetchAddresses(token: _user.token),
                      color: Theme.of(context).primaryColor,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: state.addresses.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return AddressCard(
                            address: state.addresses[index],
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          indent: 20,
                          endIndent: 20,
                          thickness: 1,
                        ),
                      ),
                    );
                  } else {
                    return RefreshIndicator(
                        onRefresh: () async => BlocProvider.of<AddressCubit>(context)
                            .fetchAddresses(token: _user.token),
                        color: Theme.of(context).primaryColor,
                        child: ListView(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                            )
                          ],
                        ));
                  }
                },
              ),
            ),
            space(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CustomButton(
                content: Text(
                  AppLocalizations.of(context).translate('Address.addNewAddress'),
                  style: Theme.of(context).textTheme.button,
                ),
                color: Theme.of(context).primaryColor,
                onTap: () => Navigator.of(context).push(PageTransition(
                    child: BlocProvider.value(
                        value: BlocProvider.of<AddressCubit>(context), child: AddAddressPage()),
                    type: PageTransitionType.fade)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
