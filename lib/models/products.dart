import 'package:flutter/material.dart';

import 'product.dart';

class Products {
  List<Product> items = [];
  int productsCount;
  Products({@required this.items, @required this.productsCount});

  static Products fromJson(Map<String, dynamic> json) {
    return Products(
        productsCount: json['products_count'],
        items: List<Product>.from(json['products'].map((product) => Product.fromJson(product))));
  }
}
