import 'package:flutter/material.dart';

import 'translation_configuration/app_localizations.dart';

/// Responsible of handling themes.
class CustomThemeMode {
  static var _textTheme = TextTheme(
      headline5: TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w400),
      headline1: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      headline2: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      headline3: TextStyle(color: Colors.black, fontSize: 16, height: 1.3),
      bodyText1: TextStyle(color: Colors.white, fontSize: 16),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      button: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ));

  static light(BuildContext context) {
    var langCode = AppLocalizations.of(context).locale.languageCode;
    return ThemeData(
        primaryColor: Color(0xFFFFC200),
        cursorColor: Color(0xFFFFC200),
        iconTheme: IconThemeData(color: Colors.black54),
        buttonColor: Colors.black,
        backgroundColor: Colors.white,
        fontFamily: langCode == 'ar' ? 'Cairo' : 'Roboto',
        textTheme: _textTheme.apply(fontSizeDelta: langCode == 'ar' ? -2 : 0));
  }

  static final dark = ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.white,
      cursorColor: Colors.blue,
      canvasColor: Colors.indigo.shade50,
      buttonColor: Colors.black54,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Roboto',
      textTheme: TextTheme(

          /// For last message.
          headline5: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
          headline1: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(color: Colors.black, fontSize: 16),

          /// For Contacts names
          headline4: TextStyle(color: Colors.black.withOpacity(0.55), fontSize: 14),

          /// Bigger Contacts name
          headline6: TextStyle(color: Colors.black.withOpacity(0.55), fontSize: 16),

          /// For drawer
          headline2: TextStyle(color: Colors.black54, fontSize: 18),
          button: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 18,
          )));
}
