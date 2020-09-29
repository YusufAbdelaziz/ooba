import 'package:Ooba/blocs/global_blocs/auth/auth_cubit.dart';
import 'package:Ooba/blocs/global_blocs/email_username_validation/email_username_validation_bloc.dart';
import 'package:Ooba/blocs/global_blocs/language/language_bloc.dart';
import 'package:Ooba/blocs/global_blocs/password_validation/password_validation_bloc.dart';
import 'package:Ooba/blocs/global_blocs/password_visibility/password_visibility_cubit.dart';
import 'package:Ooba/blocs/global_blocs/state_handler_cubit/state_handler_cubit.dart';
import 'package:Ooba/common/translation_configuration/app_localizations.dart';
import 'package:Ooba/common/translation_configuration/shared_preferences_service.dart';
import 'package:Ooba/utilities/space.dart';
import 'package:Ooba/widgets/auth_pages/custom_auth_footer.dart';
import 'package:Ooba/widgets/auth_pages/custom_auth_header.dart';
import 'package:Ooba/widgets/auth_pages/custom_button.dart';
import 'package:Ooba/widgets/common/custom_appbar.dart';
import 'package:Ooba/widgets/common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var _usernameEmailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _usernameEmailFocusNode = FocusNode();
  var _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameEmailController.dispose();
    _passwordController.dispose();
    _usernameEmailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StateHandlerCubit>(
          create: (_) => StateHandlerCubit(),
        ),
        BlocProvider<PasswordVisibilityCubit>(
          create: (_) => PasswordVisibilityCubit(),
        ),
        BlocProvider<PasswordValidationBloc>(
          create: (_) => PasswordValidationBloc(),
        ),
        BlocProvider<EmailUsernameValidationBloc>(
          create: (_) => EmailUsernameValidationBloc(),
        )
      ],
      child: Builder(
        builder: (context) => Scaffold(
          appBar: CustomAppBar(
            title: AppLocalizations.of(context).translate('SignIn.signIn'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CustomAuthHeader(
                              title: AppLocalizations.of(context).translate('SignIn.letsSignYouIn'),
                              subTitle:
                                  AppLocalizations.of(context).translate('SignIn.welcomeBack'),
                            ),
                            space(height: 20),
                            BlocBuilder<EmailUsernameValidationBloc, EmailUsernameValidationState>(
                                builder: (context, state) {
                              String usernameEmailErrorTxt;
                              if (state is UsernameEmailInvalid) {
                                usernameEmailErrorTxt = AppLocalizations.of(context)
                                    .translate('SignUp.usernameEmailInvalid');
                              }
                              return CustomTextField(
                                controller: _usernameEmailController,
                                errorText: usernameEmailErrorTxt,
                                focusNode: _usernameEmailFocusNode,
                                onSubmitted: (_) =>
                                    FocusScope.of(context).autofocus(_passwordFocusNode),
                                labelText: AppLocalizations.of(context)
                                    .translate('SignIn.userNameOrEmail'),
                                onChanged: (usernameEmail) =>
                                    BlocProvider.of<EmailUsernameValidationBloc>(context)
                                        .add(UsernameEmailChecked(usernameEmail: usernameEmail)),
                              );
                            }),
                            space(height: 10),
                            BlocBuilder<PasswordValidationBloc, PasswordValidationState>(
                              builder: (context, state) {
                                String passwordErrorTxt;
                                if (state is SignUpPasswordsInvalid) {
                                  passwordErrorTxt = AppLocalizations.of(context)
                                      .translate('SignIn.passwordInvalid');
                                } else if (state is SignUpPasswordsValid) {
                                  passwordErrorTxt = null;
                                }
                                return BlocBuilder<PasswordVisibilityCubit,
                                    PasswordVisibilityState>(builder: (context, state) {
                                  bool isVisible = false;
                                  if (state is SwitchPasswordVisibility) {
                                    isVisible = state.isVisible;
                                  }
                                  return CustomTextField(
                                    controller: _passwordController,
                                    focusNode: _passwordFocusNode,
                                    errorText: passwordErrorTxt,
                                    onSubmitted: (_) => FocusScope.of(context).unfocus(),
                                    labelText:
                                        AppLocalizations.of(context).translate('SignIn.password'),
                                    inputType: TextInputType.visiblePassword,
                                    obscureText: isVisible ? false : true,
                                    onChanged: (pass) =>
                                        BlocProvider.of<PasswordValidationBloc>(context)
                                            .add(SignInPasswordChecked(password: pass)),
                                    suffixIcon: InkWell(
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () =>
                                            BlocProvider.of<PasswordVisibilityCubit>(context)
                                                .switchPasswordVisibility(isVisible: !isVisible),
                                        child: Icon(
                                            isVisible ? Icons.visibility : Icons.visibility_off)),
                                  );
                                });
                              },
                            ),
                            space(height: 20),
                            Row(
                              children: [
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: BlocBuilder<StateHandlerCubit, StateHandlerState>(
                                      builder: (context, state) {
                                    bool value = false;
                                    if (state is StateSwitched) {
                                      value = state.value;
                                    }
                                    return Checkbox(
                                      value: value,
                                      activeColor: Colors.black,
                                      checkColor: Theme.of(context).primaryColor,
                                      onChanged: (val) =>
                                          BlocProvider.of<StateHandlerCubit>(context)
                                              .valueSwitched(value: val),
                                    );
                                  }),
                                ),
                                space(width: 10),
                                Text(AppLocalizations.of(context).translate('SignIn.rememberMe'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(fontSize: 15)),
                                Spacer(),
                                GestureDetector(
                                  onTap: () =>
                                      BlocProvider.of<AuthCubit>(context).forgetPasswordSwitched(),
                                  child: Text(
                                      AppLocalizations.of(context)
                                          .translate('SignIn.forgetPassword'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            space(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  CustomButton(
                                      color: Theme.of(context).primaryColor,
                                      label:
                                          AppLocalizations.of(context).translate('SignIn.signIn')),
                                  CustomButton(
                                    color: Theme.of(context).buttonColor,
                                    label: AppLocalizations.of(context)
                                        .translate('SignIn.signInWithGoogle'),
                                    logoAsset: 'assets/images/google.png',
                                  ),
                                  CustomButton(
                                    color: Theme.of(context).buttonColor,
                                    label: AppLocalizations.of(context)
                                        .translate('SignIn.signInWithFacebook'),
                                    logoAsset: 'assets/images/facebook.png',
                                  ),
                                  space(height: 10),
                                  CustomAuthFooter(
                                    onTap: () =>
                                        BlocProvider.of<AuthCubit>(context).signUpSwitched(),
                                    normalText: AppLocalizations.of(context)
                                        .translate('SignIn.dontHaveAccount'),
                                    boldText: AppLocalizations.of(context)
                                        .translate('SignIn.signUpNewAccount'),
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
}
