import 'package:flutter/material.dart';

import 'address.dart';

/// A singleton user model.
class User {
  static final User _user = User._();
  String name;
  String email;
  String id;
  String token;
  Address defaultAddress;
  bool isAuthenticated = false;
  bool isRemembered = false;
  factory User() {
    return _user;
  }

  User._();

  void fromJson(
      {@required Map<String, dynamic> json,
      bool isRemembered = false,
      bool isAuthenticated = false}) {
    this.token = json['token'];
    final userMap = json['user'];
    this.name = userMap['display_name'];
    this.email = userMap['user_email'];
    this.id = userMap['ID'];
    this.defaultAddress =
         Address.fromJson(userMap['address']);
    this.isRemembered = json['isRemembered'] ?? isRemembered;
    this.isAuthenticated = json['isAuthenticated'] ?? isAuthenticated;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final userMap = <String, dynamic>{};
    map['token'] = this.token;
    map['isRemembered'] = this.isRemembered;
    map['isAuthenticated'] = this.isAuthenticated;
    userMap['display_name'] = this.name;
    userMap['ID'] = this.id;
    userMap['address'] = this.defaultAddress.toJson();
    userMap['user_email'] = this.email;
    map['user'] = userMap;
    return map;
  }

  void initialize() {
    this.isAuthenticated = false;
    this.isRemembered = false;
  }

  void updateAddress(Address address) {
    this.defaultAddress = address;
  }

  @override
  String toString() {
    return 'User : {token : $token , isRemembered : $isRemembered , isAuthenticated : $isAuthenticated , Default Address : $defaultAddress}';
  }
}
