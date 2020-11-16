import 'dart:convert';

import 'package:Ooba/models/cart_item.dart';
import 'package:Ooba/repos/user_repo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartRepo {
  static final _url = 'https://itsooba.com/wp-admin/admin-ajax.php';

  static Future<bool> addToCart({@required int id, @required int quantity}) async {
    print(json.encode([
      {"id": id, "quantity": quantity}
    ]));
    final response = await http.post(_url, body: {
      'action': 'add_to_cart',
      'token': UserRepo.getUser().token,
      'products': json.encode([
        {"id": id, "quantity": quantity}
      ]),
    });
    var body = json.decode(response.body);
    print(body);
    if (response.statusCode == 200 && body["status"] == "success")
      return true;
    else
      throw Exception("Try again later");
  }

  static Future<List<CartItem>> fetchCart() async {
    final response = await http.post(_url ,body: {
      'token':"e5328d08aa47c8a3ae3ed3c1c16185b4fac84ed2a12e9e2e8c8c6589afcf872c",
      'action':'get_cart',
    });
    var body = json.decode(response.body);
    print(response.body);
    if (response.statusCode == 200 && body["status"] == "success")
      return List<CartItem>.from(json.decode(response.body)['data'].map((item) => CartItem.fromJson(item)));
    else
      throw Exception("Try again later");
  }
}
