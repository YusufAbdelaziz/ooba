import 'package:flutter/material.dart';

class Product {
  final String name;
  final int id;
  final List<String> imagesUrl;
  final String price;
  final int stockQuantity;
  final String description;
  final String shortDescription;
  bool isFavorite;
  Product(
      {@required this.name,
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
    map['name'] = this.name;
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
        shortDescription: json['short_description'],
        stockQuantity: json['stock_quantity'],
        name: json['name'],
        id: json['id'],
        isFavorite: json['is_favourite'],
        imagesUrl: List<String>.from(json['gallery_images'].map((image) => image['path'])),
        price: json['price']);
  }

  @override
  String toString() {
    return '{Name : ${this.name} , ID : ${this.id}, Price : ${this.price}}';
  }
}
