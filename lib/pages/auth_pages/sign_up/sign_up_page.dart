import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/common/custom_button.dart';
import '../../../blocs/global_blocs/auth/auth_cubit.dart';
import '../../../blocs/global_blocs/email_username_validation/email_username_validation_bloc.dart';
import '../../../blocs/global_blocs/language/language_bloc.dart';
import '../../../blocs/global_blocs/main_cubit/main_cubit.dart';
import '../../../blocs/global_blocs/password_validation/password_validation_bloc.dart';
import '../../../blocs/global_blocs/password_visibility/password_visibility_cubit.dart';
import '../../../common/translation_configuration/app_localizations.dart';
import '../../../common/translation_configuration/shared_preferences_service.dart';
import '../../../utilities/space.dart';
import '../../../widgets/auth_pages/custom_auth_footer.dart';
import '../../../widgets/auth_pages/custom_auth_header.dart';
import '../../../widgets/common/custom_appbar.dart';
import '../../../widgets/common/custom_text_field.dart';
import '../../../widgets/main_product_pages/custom_snack_bar.dart';
import '../../../widgets/main_product_pages/custom_loading_indicator.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmailUsernameValidationBloc>(
          create: (_) => EmailUsernameValidationBloc(),
        ),
        BlocProvider<PasswordValidationBloc>(
          create: (_) => PasswordValidationBloc(),
        ),
        BlocProvider<PasswordVisibilityCubit>(
          create: (_) => PasswordVisibilityCubit(),
        )
      ],
      child: Builder(
        builder: (context) => Scaffold(
          appBar: CustomAppBar(
            title: AppLocalizations.of(context).translate('SignUp.signUp'),
            backAction: () => Navigator.of(context).pop(),
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
                            BlocBuilder<EmailUsernameValidationBloc, EmailUsernameValidationState>(
                                builder: (context, state) {
                              String emailErrorTxt;
                              String usernameErrorTxt;
                              if (state is EmailInvalid) {
                                emailErrorTxt =
                                    AppLocalizations.of(context).translate('SignUp.emailInvalid');
                              } else if (state is UsernameInvalid) {
                                usernameErrorTxt = AppLocalizations.of(context)
                                    .translate('SignUp.usernameInvalid');
                              }
                              return Column(
                                children: [
                                  CustomTextField(
                                      controller: _usernameController,
                                      focusNode: _usernameFocusNode,
                                      labelText:
                                          AppLocalizations.of(context).translate('SignUp.username'),
                                      errorText: usernameErrorTxt,
                                      onSubmitted: (_) =>
                                          FocusScope.of(context).autofocus(_emailFocusNode),
                                      onChanged: (username) =>
                                          BlocProvider.of<EmailUsernameValidationBloc>(context)
                                              .add(UsernameChecked(username: username))),
                                  space(height: 10),
                                  CustomTextField(
                                    controller: _emailController,
                                    focusNode: _emailFocusNode,
                                    inputType: TextInputType.emailAddress,
                                    errorText: emailErrorTxt,
                                    labelText:
                                        AppLocalizations.of(context).translate('SignUp.email'),
                                    onSubmitted: (_) =>
                                        FocusScope.of(context).autofocus(_phoneFocusNode),
                                    onChanged: (email) =>
                                        BlocProvider.of<EmailUsernameValidationBloc>(context)
                                            .add(EmailChecked(email: email)),
                                  ),
                                ],
                              );
                            }),
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
                            BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
                              builder: (context, state) {
                                bool isPassVisible = false;
                                bool isConfirmPassVisible = false;
                                if (state is SwitchPasswordVisibility) {
                                  isPassVisible = state.isVisible;
                                } else if (state is SwitchConfirmPasswordVisibility) {
                                  isConfirmPassVisible = state.isVisible;
                                }
                                return BlocBuilder<PasswordValidationBloc, PasswordValidationState>(
                                    builder: (context, state) {
                                  String passwordErrorTxt;
                                  String confirmPasswordErrorTxt;
                                  if (state is SignUpPasswordsInvalid) {
                                    passwordErrorTxt = AppLocalizations.of(context)
                                        .translate('SignUp.passwordInvalid');
                                  } else if (state is SignUpPasswordsValid) {
                                    passwordErrorTxt = null;
                                    confirmPasswordErrorTxt = null;
                                  } else if (state is SignUpPasswordsNotEqual) {
                                    confirmPasswordErrorTxt = AppLocalizations.of(context)
                                        .translate('SignUp.passwordsNotEqual');
                                  }
                                  return Column(
                                    children: [
                                      CustomTextField(
                                        controller: _passwordController,
                                        obscureText: isPassVisible ? false : true,
                                        focusNode: _passwordFocusNode,
                                        errorText: passwordErrorTxt,
                                        inputType: TextInputType.visiblePassword,
                                        labelText: AppLocalizations.of(context)
                                            .translate('SignUp.password'),
                                        onSubmitted: (_) => FocusScope.of(context)
                                            .autofocus(_confirmPasswordFocusNode),
                                        onChanged: (password) =>
                                            BlocProvider.of<PasswordValidationBloc>(context).add(
                                                SignUpPasswordsChecked(
                                                    password: _passwordController.text,
                                                    confirmPassword:
                                                        _confirmPasswordController.text)),
                                        suffixIcon: InkWell(
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () =>
                                                BlocProvider.of<PasswordVisibilityCubit>(context)
                                                    .switchPasswordVisibility(
                                                        isVisible: !isPassVisible),
                                            child: Icon(isPassVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off)),
                                      ),
                                      space(height: 10),
                                      CustomTextField(
                                        controller: _confirmPasswordController,
                                        focusNode: _confirmPasswordFocusNode,
                                        errorText: confirmPasswordErrorTxt,
                                        obscureText: isConfirmPassVisible ? false : true,
                                        inputType: TextInputType.visiblePassword,
                                        labelText: AppLocalizations.of(context)
                                            .translate('SignUp.confirmPassword'),
                                        onSubmitted: (_) => FocusScope.of(context).unfocus(),
                                        onChanged: (password) =>
                                            BlocProvider.of<PasswordValidationBloc>(context).add(
                                                SignUpPasswordsChecked(
                                                    password: _passwordController.text,
                                                    confirmPassword:
                                                        _confirmPasswordController.text)),
                                        suffixIcon: InkWell(
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () =>
                                                BlocProvider.of<PasswordVisibilityCubit>(context)
                                                    .switchConfirmPasswordVisibility(
                                                        isVisible: !isConfirmPassVisible),
                                            child: Icon(isConfirmPassVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off)),
                                      ),
                                    ],
                                  );
                                });
                              },
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
                                    if (state is SignUpSuccess) {
                                      Navigator.of(context).pop();
                                      BlocProvider.of<MainCubit>(context).switchMainPages();
                                    } else if (state is SignUpFail) {
                                      CustomSnackBar.showSnackBar(
                                          context: context, textMsg: state.errorMsg);
                                    }
                                  }, builder: (context, state) {
                                    return CustomButton(
                                      color: Theme.of(context).primaryColor,
                                      content: state is SignUpLoading
                                          ? CustomLoadingIndicator(
                                              verticalPadding: 5,
                                              color: Colors.white,
                                            )
                                          : Text(
                                              AppLocalizations.of(context)
                                                  .translate('SignUp.signUp'),
                                              style: Theme.of(context).textTheme.button,
                                            ),
                                      onTap: () {
                                        print('I aaam signing up');
                                        final passwordState =
                                            BlocProvider.of<PasswordValidationBloc>(context).state;
                                        print('passwordState --> $passwordState');
                                        final isValidEmailAndUsername =
                                            areEmailAndUsernameValid(context);
                                        print(
                                            'isValidEmailAndUsername --> $isValidEmailAndUsername');

                                        if (passwordState is SignUpPasswordsValid &&
                                            isValidEmailAndUsername) {
                                          BlocProvider.of<AuthCubit>(context).signUp(
                                              username: _usernameController.text,
                                              email: _emailController.text,
                                              password: _passwordController.text,
                                              phone: _phoneController.text,
                                              confirmPassword: _confirmPasswordController.text);
                                        } else {
                                          CustomSnackBar.showSnackBar(
                                              context: context,
                                              textMsg: AppLocalizations.of(context)
                                                  .translate('SignUp.fillCorrectInfo'));
                                        }
                                      },
                                    );
                                  }),
                                  // CustomButton(
                                  //   color: Theme.of(context).buttonColor,
                                  //   label: AppLocalizations.of(context)
                                  //       .translate('SignUp.continueWithGoogle'),
                                  //   logoAsset: 'assets/images/google.png',
                                  // ),
                                  // CustomButton(
                                  //   color: Theme.of(context).buttonColor,
                                  //   label: AppLocalizations.of(context)
                                  //       .translate('SignUp.continueWithFacebook'),
                                  //   logoAsset: 'assets/images/facebook.png',
                                  // ),
                                  space(height: 10),
                                  CustomAuthFooter(
                                    onTap: () => Navigator.of(context).pop(),
                                    normalText: AppLocalizations.of(context)
                                        .translate('SignUp.alreadyHaveAccount'),
                                    boldText:
                                        AppLocalizations.of(context).translate('SignUp.signIn'),
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
      ),
    );
  }

  bool areEmailAndUsernameValid(BuildContext context) {
    final currentState = BlocProvider.of<EmailUsernameValidationBloc>(context).state;
    return (currentState is! UsernameInvalid && currentState is! EmailInvalid);
  }
}
