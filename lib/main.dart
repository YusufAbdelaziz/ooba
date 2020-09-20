import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oppa_app/blocs/global_blocs/auth_bloc/auth_cubit.dart';
import 'package:oppa_app/common/custom_theme_mode.dart';
import 'package:oppa_app/pages/auth_pages/sign_in/sign_in_page.dart';
import 'package:oppa_app/pages/auth_pages/sign_up/sign_up_page.dart';

import 'blocs/global_blocs/language_bloc/language_bloc.dart';
import 'common/bloc_observer.dart';
import 'common/translation_configuration/app_localizations.dart';

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
        title: 'Flutter Demo',
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
          // ignore: missing_return
          widget = SignInPage();
        } else if (state is AuthSignUp) {
          // ignore: missing_return
          widget = SignUpPage();
        } else if (state is AuthForgetPassword) {
          // ignore: missing_return
          /// TODO : Add Forget password page.
        } else if (state is AuthEmailCheck) {
          // ignore: missing_return
          /// TODO : Add Email check page.
        } else if (state is AuthPhoneVerification) {
          // ignore: missing_return
          /// TODO : Add phone verification page.
        }
        return widget;
      },
    );
  }
}
