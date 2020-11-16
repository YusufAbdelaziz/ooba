import 'package:Ooba/models/product.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String price;
  final int quantity;
  final Product product;

  CartItem({@required this.price, @required this.quantity, @required this.product});

  static CartItem fromJson(Map<String, dynamic> json) {
    return CartItem(
      quantity: json['quantity'],
      price: json['line_total'],
      product: Product.fromJson(json["product"]),
    );
  }

  @override
  String toString() {
    return '{Name : ${this.product.name} , ID : ${this.product.id}, Price : ${this.price}}';
  }
}
