import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/global_blocs/language_bloc/language_bloc.dart';
import 'common/bloc_observer.dart';
import 'common/translation_configuration/app_localizations.dart';
import 'common/translation_configuration/shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LanguageBloc>(
      create: (context) => LanguageBloc()..add(LanguageLoadStarted()),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        supportedLocales: [Locale('ar', 'EG'), Locale('en', 'US')],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainApp(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  MainApp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations.of(context).translate('arabic')),
            FlatButton(
              child: Text('Click Here For Arabic'),
              onPressed: () => BlocProvider.of<LanguageBloc>(context)
                  .add(LanguageSelected(languageCode: Language.AR)),
            ),
            FlatButton(
              child: Text('Click Here For English'),
              onPressed: () => BlocProvider.of<LanguageBloc>(context)
                  .add(LanguageSelected(languageCode: Language.EN)),
            )
          ],
        ),
      ),
    );
  }
}
