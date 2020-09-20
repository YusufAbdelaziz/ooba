import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oppa_app/blocs/global_blocs/auth_bloc/auth_cubit.dart';
import 'package:oppa_app/blocs/global_blocs/language_bloc/language_bloc.dart';
import 'package:oppa_app/blocs/global_blocs/password_visibility/password_visibility_cubit.dart';
import 'package:oppa_app/blocs/global_blocs/state_handler_cubit/state_handler_cubit.dart';
import 'package:oppa_app/common/translation_configuration/app_localizations.dart';
import 'package:oppa_app/common/translation_configuration/shared_preferences_service.dart';
import 'package:oppa_app/widgets/auth_pages/custom_auth_appbar.dart';
import 'package:oppa_app/widgets/auth_pages/custom_auth_button.dart';
import 'package:oppa_app/widgets/auth_pages/custom_auth_footer.dart';
import 'package:oppa_app/widgets/auth_pages/custom_auth_header.dart';
import 'package:oppa_app/widgets/auth_pages/custom_text_field.dart';

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
          create: (context) => StateHandlerCubit(),
        ),
        BlocProvider<PasswordVisibilityCubit>(
          create: (context) => PasswordVisibilityCubit()..switchVisibility(isVisible: false),
        )
      ],
      child: Builder(
        builder: (context) => Scaffold(
          appBar: CustomAuthAppBar(
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
                            CustomTextField(
                              controller: _usernameEmailController,
                              focusNode: _usernameEmailFocusNode,
                              onSubmitted: (_) =>
                                  FocusScope.of(context).autofocus(_passwordFocusNode),
                              labelText:
                                  AppLocalizations.of(context).translate('SignIn.userNameOrEmail'),
                            ),
                            space(height: 10),
                            BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
                                builder: (context, state) {
                              bool isVisible;
                              if (state is SwitchPasswordVisibility) {
                                isVisible = state.isVisible;
                              }
                              return CustomTextField(
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                onSubmitted: (_) => FocusScope.of(context).unfocus(),
                                labelText:
                                    AppLocalizations.of(context).translate('SignIn.password'),
                                inputType: TextInputType.visiblePassword,
                                obscureText: isVisible ? false : true,
                                suffixIcon: InkWell(
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () => BlocProvider.of<PasswordVisibilityCubit>(context)
                                        .switchVisibility(isVisible: !isVisible),
                                    child:
                                        Icon(isVisible ? Icons.visibility : Icons.visibility_off)),
                              );
                            }),
                            space(height: 10),
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
                            space(height: 35),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  CustomAuthButton(
                                      color: Theme.of(context).primaryColor,
                                      label:
                                          AppLocalizations.of(context).translate('SignIn.signIn')),
                                  CustomAuthButton(
                                    color: Theme.of(context).buttonColor,
                                    label: AppLocalizations.of(context)
                                        .translate('SignIn.signInWithGoogle'),
                                    logoAsset: 'assets/images/google.png',
                                  ),
                                  CustomAuthButton(
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

  SizedBox space({double height, double width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
