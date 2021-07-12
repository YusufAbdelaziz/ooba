import 'dart:convert';

import 'package:Ooba/repos/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/address.dart';

class AddressRepo {
  // static const _url = '';
  static final _user = UserRepo.getUser();
  static Future<List<Address>> fetchAddresses({@required String token}) async {
    // final response = await http
    //     .post(_url, body: <String, String>{'action': 'get_previous_addresses', 'token': token});
    // final body = response.body;
    // final parsedBody = json.decode(body);
    // if (parsedBody['status'] != 'success') {
    //   throw parsedBody['message'];
    // }
    final addresses = generateDummyAddresses();
    var defaultAddressIndex =
        addresses.indexWhere((element) => element.id == _user.defaultAddress.id);
    if (defaultAddressIndex != -1) {
      addresses[defaultAddressIndex] = addresses[defaultAddressIndex].copyWith(isDefault: true);
    }
    return addresses;
  }

  static Future<List<Address>> addAddress({@required Address address}) async {
    // final response = await http.post(_url, body: <String, String>{
    //   'action': 'add_address',
    //   'token': _user.token,
    //   'contact_name': address.contactName,
    //   'phone': address.phone,
    //   'email': address.email,
    //   'address_line_1': address.addressLine1,
    //   'address_line_2': address.addressLine2,
    //   'country': address.country,
    //   'zip_code': address.zipCode,
    //   'city': address.city
    // });
    // final parsedBody = json.decode(response.body);
    // if (parsedBody['status'] != 'success') {
    //   throw parsedBody['message'];
    // }
    final addresses = generateDummyAddresses()..add(address);
    if (addresses.length == 1) {
      addresses[0] = addresses[0].copyWith(isDefault: true);
      await UserRepo.setDefaultAddress(defaultAddress: addresses[0]);
    } else {
      var defaultAddressIndex =
          addresses.indexWhere((element) => element.id == _user.defaultAddress.id);
      if (defaultAddressIndex != -1) {
        addresses[defaultAddressIndex] = addresses[defaultAddressIndex].copyWith(isDefault: true);
      }
    }
    return addresses;
  }

  static Future<void> setDefaultAddress({@required Address address}) async {
    await UserRepo.setDefaultAddress(defaultAddress: address);
  }
}

List<Address> generateDummyAddresses() {
  return List.generate(
      5,
      (index) => Address(
          id: index,
          phone: '01004895720',
          email: '',
          city: 'Minya',
          isDefault: false,
          country: 'Egypt',
          addressLine2: 'Test address $index',
          contactName: 'Jo',
          zipCode: '615487',
          addressLine1: 'test address $index'));
}
