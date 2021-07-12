import 'dart:convert';

import 'package:Ooba/models/address.dart';
import 'package:Ooba/repos/user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  static final _url = 'https://itsooba.com/wp-admin/admin-ajax.php';

  /// Used to log the user in, if successful, user data is cached.
  static Future<void> login(
      {@required String usernameOrEmail,
      @required String password,
      @required bool isAuthenticated,
      @required bool isRemembered}) async {
    // final response = await http.post(_url, body: {
    //   'action': 'REST_API_WooCommerce_login',
    //   'username': usernameOrEmail,
    //   'password': password
    // });
    // final body = json.decode(response.body);
    // if (body['status'] == 'error') {
    //   throw body['message'];
    // } else {
    UserRepo.storeData(
        userData: generateDummyUserData(), isRemembered: true, isAuthenticated: true);
    // }
  }

  static Future<void> signUp(
      {@required bool isAuthenticated,
      @required String username,
      @required String email,
      @required String password,
      @required String phone,
      @required String confirmPassword}) async {
    // final response = await http.post(_url, body: {
    //   'action': 'REST_API_WooCommerce_register',
    //   'username': username,
    //   'email': email,
    //   'phone': phone,
    //   'password': password,
    //   'confirm_password': confirmPassword
    // });
    // final body = json.decode(response.body);
    // if (body['status'] == 'error') {
    //   throw body['message'];
    // } else {
    UserRepo.storeData(
        isRemembered: true, userData: generateDummyUserData(), isAuthenticated: isAuthenticated);
    // }
  }

  static Future<void> logout() async {
    await UserRepo.deleteData();
  }
}

Map<String, dynamic> generateDummyUserData() {
  final map = <String, dynamic>{};
  map['token'] = 'xw89e4f9a46ff1asc8ac';
  final userMap = <String, dynamic>{};
  userMap['display_name'] = 'Yusuf Abdelaziz ';
  userMap['user_email'] = 'yussefislamanwer@gmail.com';
  userMap['ID'] = '1';
  userMap['address'] = Address(
          id: 1,
          phone: '01004895720',
          email: '',
          city: 'Minya',
          isDefault: true,
          country: 'Egypt',
          addressLine2: 'Test address 1',
          contactName: 'Jo',
          zipCode: '615487',
          addressLine1: 'test address 2')
      .toJson();
  map['user'] = userMap;
  return map;
}
