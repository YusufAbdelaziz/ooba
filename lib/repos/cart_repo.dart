import 'dart:convert';

import 'package:Ooba/models/cart_item.dart';
import 'package:Ooba/models/product.dart';
import 'package:Ooba/repos/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartRepo {
  static final _url = '';

  static Future<bool> addToCart({@required int id, @required int quantity}) async {
    print(json.encode([
      {"id": id, "quantity": quantity}
    ]));
    final response = await http.post(Uri.parse(_url), body: {
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
    // final response = await http.post(_url, body: {
    //   'token': UserRepo.getUser().token,
    //   'action': 'get_cart',
    // });
    // var body = json.decode(response.body);
    // print(response.body);
    // if (response.statusCode == 200 && body["status"] == "success")
    //   return List<CartItem>.from(
    //       json.decode(response.body)['data'].map((item) => CartItem.fromJson(item)));
    // else
    //   throw Exception("Try again later");
    return await generateCartItems();
  }

  static Future<bool> checkout(int addressId) async {
    // final response = await http.post(_url ,body: {
    //   'token':UserRepo.getUser().token,
    //   'action':'REST_API_WooCommerce_checkout',
    //   'data_hash':'b5c1d5ca8bae6d4896cf1807cdf763f0',
    //   "address_id":addressId.toString()
    // });
    // var body = json.decode(response.body);
    // print(response.body);
    // if (response.statusCode == 200 && body["status"] == "success")
    //   return true;
    // else
    //   return false;
    return true;
  }
}

Future<List<CartItem>> generateCartItems() async {
  final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

  final products =
      List<Product>.from(json.decode(response.body).map((product) => Product.fromJson(product)))
          .getRange(0, 5)
          .toList();
  return List.generate(
      products.length,
      (index) =>
          CartItem(product: products[index], quantity: index + 1, price: products[index].price.toString()));
}
