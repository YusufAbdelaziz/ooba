import 'package:shared_preferences/shared_preferences.dart';

enum Language { EN, AR }

/// Constants for SharedPreferences. Used to store user's language selection.
class SharedPrefKeys {
  SharedPrefKeys._();
  static const String languageCode = 'languageCode';
}

class SharedPreferencesService {
  static SharedPreferencesService _instance;
  static SharedPreferences _preferences;

  SharedPreferencesService._internal();

  /// Creating SharedPreferencesService singleton and instantiate SharedPreference instance.
  static Future<SharedPreferencesService> get instance async {
    if (_instance == null) {
      _instance = SharedPreferencesService._internal();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  Future<void> setLanguage(String langCode) async =>
      await _preferences.setString(SharedPrefKeys.languageCode, langCode);

  String get languageCode => _preferences.getString(SharedPrefKeys.languageCode);
}
