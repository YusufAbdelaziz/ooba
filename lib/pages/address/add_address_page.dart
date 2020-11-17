import 'package:Ooba/blocs/address_cubit/address_cubit.dart';
import 'package:Ooba/models/address.dart';
import 'package:Ooba/utilities/custom_snack_bar.dart';
import 'package:Ooba/widgets/main_product_pages/custom_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../utilities/space.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';

class AddAddressPage extends StatefulWidget {
  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController _contactNameController;
  TextEditingController _emailController;
  TextEditingController _phoneController;
  TextEditingController _addressLine1Controller;
  TextEditingController _addressLine2Controller;
  TextEditingController _zipCodeController;
  TextEditingController _countryController;
  TextEditingController _cityController;
  FocusNode _contactNameFocusNode;
  FocusNode _emailFocusNode;
  FocusNode _phoneFocusNode;
  FocusNode _addressLine1FocusNode;
  FocusNode _addressLine2FocusNode;
  FocusNode _zipCodeFocusNode;
  FocusNode _countryFocusNode;
  FocusNode _cityFocusNode;

  bool isDefault = false;

  @override
  void initState() {
    super.initState();
    _contactNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressLine1Controller = TextEditingController();
    _addressLine2Controller = TextEditingController();
    _zipCodeController = TextEditingController();
    _countryController = TextEditingController();
    _cityController = TextEditingController();
    _contactNameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _addressLine1FocusNode = FocusNode();
    _addressLine2FocusNode = FocusNode();
    _zipCodeFocusNode = FocusNode();
    _countryFocusNode = FocusNode();
    _cityFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _contactNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _contactNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _addressLine1FocusNode.dispose();
    _addressLine2FocusNode.dispose();
    _zipCodeFocusNode.dispose();
    _countryFocusNode.dispose();
    _cityFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: CustomAppBar(
          title: AppLocalizations.of(context).translate('Address.shippingAddress'),
          backAction: () => Navigator.of(context).pop(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Text(
                AppLocalizations.of(context).translate('Address.header'),
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              space(height: 20),
              CustomTextField(
                  controller: _contactNameController,
                  focusNode: _contactNameFocusNode,
                  onSubmitted: (_) => FocusScope.of(context).autofocus(_emailFocusNode),
                  labelText: AppLocalizations.of(context).translate('Address.addressName'),
                  onChanged: (usernameEmail) {}),
              space(height: 20),
              CustomTextField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  onSubmitted: (_) => FocusScope.of(context).autofocus(_phoneFocusNode),
                  labelText: AppLocalizations.of(context).translate('Address.email'),
                  onChanged: (usernameEmail) {}),
              space(height: 20),
              CustomTextField(
                  controller: _phoneController,
                  focusNode: _phoneFocusNode,
                  onSubmitted: (_) => FocusScope.of(context).autofocus(_addressLine1FocusNode),
                  labelText: AppLocalizations.of(context).translate('Address.phoneNumber'),
                  onChanged: (usernameEmail) {}),
              space(height: 20),
              CustomTextField(
                  controller: _addressLine1Controller,
                  focusNode: _addressLine1FocusNode,
                  onSubmitted: (_) => FocusScope.of(context).autofocus(_addressLine2FocusNode),
                  labelText: AppLocalizations.of(context).translate('Address.addressLine1'),
                  onChanged: (usernameEmail) {}),
              space(height: 20),
              CustomTextField(
                  controller: _addressLine2Controller,
                  focusNode: _addressLine2FocusNode,
                  onSubmitted: (_) => FocusScope.of(context).autofocus(_countryFocusNode),
                  labelText: AppLocalizations.of(context).translate('Address.addressLine2'),
                  onChanged: (usernameEmail) {}),
              space(height: 20),
              CustomTextField(
                  controller: _countryController,
                  focusNode: _countryFocusNode,
                  onSubmitted: (_) => FocusScope.of(context).autofocus(_cityFocusNode),
                  labelText: AppLocalizations.of(context).translate('Address.country'),
                  onChanged: (usernameEmail) {}),
              space(height: 20),
              CustomTextField(
                  controller: _cityController,
                  focusNode: _cityFocusNode,
                  onSubmitted: (_) => FocusScope.of(context).autofocus(_zipCodeFocusNode),
                  labelText: AppLocalizations.of(context).translate('Address.city'),
                  onChanged: (usernameEmail) {}),
              space(height: 20),
              CustomTextField(
                  controller: _zipCodeController,
                  focusNode: _zipCodeFocusNode,
                  onSubmitted: (_) => FocusScope.of(context).unfocus(),
                  labelText: AppLocalizations.of(context).translate('Address.zipCode'),
                  onChanged: (usernameEmail) {}),
              space(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       AppLocalizations.of(context).translate('Address.setDefault'),
              //       style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 16),
              //     ),
              //     CupertinoSwitch(
              //         activeColor: Theme.of(context).primaryColor,
              //         value: isDefault,
              //         onChanged: (bool value) {
              //           setState(() {
              //             isDefault = value;
              //           });
              //         })
              //   ],
              // ),
              space(height: 20),
              BlocConsumer<AddressCubit, AddressState>(
                listener: (context, state) {
                  if (state is AddAddressFail) {
                    CustomSnackBar.showSnackBar(context: context, textMsg: state.errorMsg);
                  } else if (state is AddAddressSuccess) {
                    Navigator.of(context).pop();
                  }
                },
                builder: (context, state) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomButton(
                      color: Theme.of(context).primaryColor,
                      onTap: () => BlocProvider.of<AddressCubit>(context)
                          .addAddress(address: _collectAddressInfo()),
                      content: state is! LoadingAddAddress
                          ? Text(
                              AppLocalizations.of(context).translate('Address.save'),
                              style: Theme.of(context).textTheme.button,
                            )
                          : CustomLoadingIndicator(
                              color: Colors.white,
                              verticalPadding: 5,
                            ),
                    )),
              ),
              space(height: 10),
            ],
          ),
        ));
  }

  Address _collectAddressInfo() {
    return Address(
        phone: _phoneController.text,
        email: _emailController.text,
        addressLine1: _addressLine1Controller.text,
        addressLine2: _addressLine2Controller.text,
        city: _cityController.text,
        country: _countryController.text,
        contactName: _contactNameController.text,
        zipCode: _zipCodeController.text,
        isDefault: isDefault);
  }
}
