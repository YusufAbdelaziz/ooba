import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import 'user_repo.dart';

class ProductsRepo {
  static const _url = '';

  static Future<List<Product>> fetchProducts(
      {int limit = 20, @required int page, String slug}) async {
    final body = <String, String>{
      'action': 'get_products',
      'page': page.toString(),
      'limit': limit.toString(),
      'token': UserRepo.getUser().token
    };
    if (slug != null) {
      body['category_slug'] = slug;
    }
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    final products = List<Product>.from(
        json.decode(response.body).map((product) => Product.fromJson(product)));
    return products;
  }

  static Future<void> favoriteProduct({@required int productId}) async {
    final body = <String, String>{
      'action': 'toggle_product_favourite',
      'token': UserRepo.getUser().token,
      'product_id': productId.toString()
    };

    // final response = await http.post(_url, body: body);
    // final responseBody = json.decode(response.body);
    // if (responseBody['status'] != 'success') {
    //   throw responseBody['message'];
    // }
  }
}
