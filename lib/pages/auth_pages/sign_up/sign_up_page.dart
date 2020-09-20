import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oppa_app/blocs/global_blocs/auth_bloc/auth_cubit.dart';
import 'package:oppa_app/blocs/global_blocs/language_bloc/language_bloc.dart';
import 'package:oppa_app/common/translation_configuration/app_localizations.dart';
import 'package:oppa_app/common/translation_configuration/shared_preferences_service.dart';
import 'package:oppa_app/widgets/auth_pages/custom_auth_appbar.dart';
import 'package:oppa_app/widgets/auth_pages/custom_auth_button.dart';
import 'package:oppa_app/widgets/auth_pages/custom_auth_footer.dart';
import 'package:oppa_app/widgets/auth_pages/custom_auth_header.dart';
import 'package:oppa_app/widgets/auth_pages/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _phoneController = TextEditingController();
  var _emailController = TextEditingController();
  var _confirmPasswordController = TextEditingController();

  var _usernameFocusNode = FocusNode();
  var _passwordFocusNode = FocusNode();
  var _phoneFocusNode = FocusNode();
  var _emailFocusNode = FocusNode();
  var _confirmPasswordFocusNode = FocusNode();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<AuthCubit>(context).signInSwitched();
        return false;
      },
      child: Scaffold(
        appBar: CustomAuthAppBar(
          title: AppLocalizations.of(context).translate('SignUp.signUp'),
          backAction: () => BlocProvider.of<AuthCubit>(context).signInSwitched(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomAuthHeader(
                            title:
                                AppLocalizations.of(context).translate('SignUp.createYouAccount'),
                            subTitle:
                                AppLocalizations.of(context).translate('SignUp.joinCommunity'),
                          ),
                          space(height: 20),
                          CustomTextField(
                              controller: _usernameController,
                              focusNode: _usernameFocusNode,
                              labelText: AppLocalizations.of(context).translate('SignUp.username'),
                              onSubmitted: (_) =>
                                  FocusScope.of(context).autofocus(_emailFocusNode)),
                          space(height: 10),
                          CustomTextField(
                            controller: _emailController,
                            focusNode: _emailFocusNode,
                            inputType: TextInputType.emailAddress,
                            labelText: AppLocalizations.of(context).translate('SignUp.email'),
                            onSubmitted: (_) => FocusScope.of(context).autofocus(_phoneFocusNode),
                          ),
                          space(height: 10),
                          CustomTextField(
                            controller: _phoneController,
                            focusNode: _phoneFocusNode,
                            inputType: TextInputType.phone,
                            labelText: AppLocalizations.of(context).translate('SignUp.phone'),
                            onSubmitted: (_) =>
                                FocusScope.of(context).autofocus(_passwordFocusNode),
                          ),
                          space(height: 10),
                          CustomTextField(
                            controller: _passwordController,
                            obscureText: true,
                            focusNode: _passwordFocusNode,
                            inputType: TextInputType.visiblePassword,
                            labelText: AppLocalizations.of(context).translate('SignUp.password'),
                            onSubmitted: (_) =>
                                FocusScope.of(context).autofocus(_confirmPasswordFocusNode),
                          ),
                          space(height: 10),
                          CustomTextField(
                            controller: _confirmPasswordController,
                            focusNode: _confirmPasswordFocusNode,
                            obscureText: true,
                            inputType: TextInputType.visiblePassword,
                            labelText:
                                AppLocalizations.of(context).translate('SignUp.confirmPassword'),
                            onSubmitted: (_) => FocusScope.of(context).unfocus(),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                CustomAuthButton(
                                    color: Theme.of(context).primaryColor,
                                    label: AppLocalizations.of(context).translate('SignUp.signUp')),
                                CustomAuthButton(
                                  color: Theme.of(context).buttonColor,
                                  label: AppLocalizations.of(context)
                                      .translate('SignUp.continueWithGoogle'),
                                  logoAsset: 'assets/images/google.png',
                                ),
                                CustomAuthButton(
                                  color: Theme.of(context).buttonColor,
                                  label: AppLocalizations.of(context)
                                      .translate('SignUp.continueWithFacebook'),
                                  logoAsset: 'assets/images/facebook.png',
                                ),space(height: 10),
                                CustomAuthFooter(
                                  onTap: () => BlocProvider.of<AuthCubit>(context).signInSwitched(),
                                  normalText: AppLocalizations.of(context)
                                      .translate('SignUp.alreadyHaveAccount'),
                                  boldText: AppLocalizations.of(context).translate('SignUp.signIn'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                      child: Text('switch lang'),
                      onPressed: () {
                        if (AppLocalizations.of(context).locale.languageCode == 'en') {
                          BlocProvider.of<LanguageBloc>(context)
                              .add(LanguageSelected(languageCode: Language.AR));
                        } else {
                          BlocProvider.of<LanguageBloc>(context)
                              .add(LanguageSelected(languageCode: Language.EN));
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox space({double height, double width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
