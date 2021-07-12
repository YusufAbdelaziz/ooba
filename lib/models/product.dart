import 'package:flutter/material.dart';

class Product {
  final String title;
  final int id;
  final List<String> imagesUrl;
  final num price;
  final int stockQuantity;
  final String description;
  final String shortDescription;
  bool isFavorite;
  Product(
      {@required this.title,
      this.isFavorite = false,
      @required this.id,
      @required this.imagesUrl,
      @required this.price,
      @required this.description,
      @required this.shortDescription,
      @required this.stockQuantity});

  Map<String, dynamic> toJson() {
    final map = {};
    map['id'] = this.id;
    map['title'] = this.title;
    map['imageUrl'] = this.imagesUrl;
    map['stock_quantity'] = this.stockQuantity;
    map['price'] = this.price;
    map['description'] = this.description;
    map['short_description'] = this.shortDescription;
    map['is_favourite'] = this.isFavorite;
    return map;
  }

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        description: json['description'],
        shortDescription: json['short_description'] ?? json['description'],
        stockQuantity: json['stock_quantity'] ?? 0,
        title: json['title'],
        id: json['id'],
        isFavorite: json['is_favourite'] ?? false,
        imagesUrl: List.generate(5, (index) => json['image']),
        price: json['price']);
  }

  @override
  String toString() {
    return '{Name : ${this.title} , ID : ${this.id}, Price : ${this.price}}';
  }
}
