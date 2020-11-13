import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _phoneController;
  TextEditingController _addressLine1Controller;
  TextEditingController _addressLine2Controller;
  TextEditingController _zipCodeController;
  TextEditingController _countryController;
  TextEditingController _cityController;
  FocusNode _nameFocusNode;
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
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressLine1Controller = TextEditingController();
    _addressLine2Controller = TextEditingController();
    _zipCodeController = TextEditingController();
    _countryController = TextEditingController();
    _cityController = TextEditingController();
    _nameFocusNode = FocusNode();
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
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _nameFocusNode.dispose();
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
                    style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 16),
                  ),
                  CupertinoSwitch(
                      activeColor: Theme.of(context).primaryColor,
                      value: isDefault,
                      onChanged: (bool value) {
                        setState(() {
                          isDefault = value;
                        });
                      })
                ],
              ),
              space(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomButton(
                    color: Theme.of(context).primaryColor,
                    onTap: () {},
                    content: Text(
                      AppLocalizations.of(context).translate('Address.save'),
                      style: Theme.of(context).textTheme.button,
                    ),
                  )),
              space(height: 10),
            ],
          ),
        ));
  }
}
