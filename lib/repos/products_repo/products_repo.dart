import 'dart:convert';

import 'package:Ooba/repos/user_repo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/product.dart';

class ProductsRepo {
  static final _url = 'https://itsooba.com/wp-admin/admin-ajax.php';

  static Future<List<Product>> fetchProducts({int limit = 20, @required int page}) async {
    final response = await http.post(_url, body: {
      'action': 'get_products',
      'page': page.toString(),
      'limit': limit.toString(),
      'token': UserRepo.getUser().token
    });

    final products = List<Product>.from(
        json.decode(response.body)['products'].map((product) => Product.fromJson(product)));

    return products;
  }
}
