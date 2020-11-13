import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

class UserRepo {
  static User _user = User();

  static Future<User> fetchData() async {
    final sharedPreference = await SharedPreferences.getInstance();
    if (sharedPreference.containsKey('userData')) {
      print('data fetched from shared preference');
      final userJson = json.decode(sharedPreference.getString('userData')) as Map<String, dynamic>;
      _user.fromJson(json: userJson);
    }
    return _user;
  }

  static bool isRemembered() {
    return _user.isRemembered;
  }

  static Future<void> storeData(
      {@required Map<String, dynamic> userData,
      @required bool isRemembered,
      @required bool isAuthenticated}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    print('data stored to shared preference');
    userData['isRemembered'] = isRemembered;
    userData['isAuthenticated'] = isAuthenticated;
    sharedPreference.setString('userData', json.encode(userData));
    _user.fromJson(json: userData);
    print('user after store --> $_user');
  }

  static Future<void> deleteData() async {
    final sharedPreference = await SharedPreferences.getInstance();
    if (sharedPreference.containsKey('userData')) {
      print('data removed from shared preference');
      sharedPreference.remove('userData');
      _user.initialize();
    }
  }

  static bool isAuthenticated() {
    return _user.isAuthenticated;
  }

  static User getUser() {
    return _user;
  }
}
