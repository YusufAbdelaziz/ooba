import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/global_blocs/auth/auth_cubit.dart';
import 'blocs/global_blocs/language/language_bloc.dart';
import 'blocs/global_blocs/main_cubit/main_cubit.dart';
import 'blocs/main_pages_bloc/products_bloc/products_bloc.dart';
import 'common/bloc_observer.dart';
import 'common/custom_theme_mode.dart';
import 'common/translation_configuration/app_localizations.dart';
import 'pages/auth_pages/sign_in/sign_in_page.dart';
import 'pages/main_pages/main_products_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LanguageBloc>(
      create: (context) => LanguageBloc()..add(LanguageLoadStarted()),
    ),
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
    ),
    BlocProvider<MainCubit>(
      create: (_) => MainCubit()..authPagesSwitched(),
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
        color: Theme.of(context).primaryColor,
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
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        Widget widget;
        if (state is AuthPages) {
          widget = SignInPage();
        } else if (state is MainPages) {
          widget = BlocProvider<ProductsBloc>(
              create: (_) => ProductsBloc()..add(ProductsFetched()), child: MainProductsPage());
        }
        return widget;
      },
    );
  }
}
