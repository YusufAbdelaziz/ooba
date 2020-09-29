import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/global_blocs/auth/auth_cubit.dart';
import 'blocs/global_blocs/language/language_bloc.dart';
import 'common/bloc_observer.dart';
import 'common/custom_theme_mode.dart';
import 'common/translation_configuration/app_localizations.dart';
import 'pages/auth_pages/email_check/email_check_page.dart';
import 'pages/auth_pages/forget_password/forget_password_page.dart';
import 'pages/auth_pages/phone_verification/phone_verification_page.dart';
import 'pages/auth_pages/sign_in/sign_in_page.dart';
import 'pages/auth_pages/sign_up/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LanguageBloc>(
      create: (context) => LanguageBloc()..add(LanguageLoadStarted()),
    ),
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit()..signInSwitched(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, langState) => MaterialApp(
        locale: langState.locale,
        title: 'Ooba',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        supportedLocales: [Locale('ar', 'EG'), Locale('en', 'US')],
        builder: (context, navigator) {
          return Theme(
            data: CustomThemeMode.light(context),
            child: navigator,
          );
        },
        home: MainApp(),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        Widget widget;
        if (state is AuthSignIn) {
          widget = SignInPage();
        } else if (state is AuthSignUp) {
          widget = SignUpPage();
        } else if (state is AuthForgetPassword) {
          widget = ForgetPasswordPage();
        } else if (state is AuthEmailCheck) {
          widget = EmailCheckPage();
        } else if (state is AuthPhoneVerification) {
          widget = PhoneVerificationPage();
        }
        return widget;
      },
    );
  }
}
