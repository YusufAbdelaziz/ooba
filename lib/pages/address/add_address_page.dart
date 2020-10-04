import 'package:Ooba/common/translation_configuration/app_localizations.dart';
import 'package:Ooba/utilities/space.dart';
import 'package:Ooba/widgets/auth_pages/custom_button.dart';
import 'package:Ooba/widgets/common/custom_appbar.dart';
import 'package:Ooba/widgets/common/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAddressPage extends StatefulWidget {
  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _phoneController = TextEditingController();
  var _addressLine1Controller = TextEditingController();
  var _addressLine2Controller = TextEditingController();
  var _zipCodeController = TextEditingController();
  var _countryController = TextEditingController();
  var _cityController = TextEditingController();
  var _nameFocusNode = FocusNode();
  var _emailFocusNode = FocusNode();
  var _phoneFocusNode = FocusNode();
  var _addressLine1FocusNode = FocusNode();
  var _addressLine2FocusNode = FocusNode();
  var _zipCodeFocusNode = FocusNode();
  var _countryFocusNode = FocusNode();
  var _cityFocusNode = FocusNode();

  bool isDefault = false;

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
            children: [
              Text(
                AppLocalizations.of(context).translate('Address.header'),
                style: Theme.of(context).textTheme.headline5,textAlign: TextAlign.center,
              ),
              space(height: 20),
              CustomTextField(
                  controller: _nameController,
                  focusNode: _nameFocusNode,
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
                  isEnabled: false,
                  suffixIcon: Icon(Icons.arrow_forward_ios),
                  onSubmitted: (_) => FocusScope.of(context).autofocus(_cityFocusNode),
                  labelText: AppLocalizations.of(context).translate('Address.country'),
                  onChanged: (usernameEmail) {}),
              space(height: 20),
              CustomTextField(
                  controller: _cityController,
                  focusNode: _cityFocusNode,
                  isEnabled: false,
                  suffixIcon: Icon(Icons.arrow_forward_ios),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context).translate('Address.setDefault'),
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 16),
                  ),
                  CupertinoSwitch(value: isDefault, onChanged: (bool value) { setState(() { isDefault = value; }); })
                ],
              ),
              space(height: 20),
              CustomButton(
                  color: Theme.of(context).primaryColor,
                  onTap: (){},
                  label:
                  AppLocalizations.of(context).translate('Address.save')),
            ],
          ),
        ));
  }
}
