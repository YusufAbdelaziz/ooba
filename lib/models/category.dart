import 'package:flutter/foundation.dart';

class Category {
  final String name;
  final int id;
  final String slug;
  Category({@required this.name, @required this.id, @required this.slug});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cat_ID'] = this.id;
    map['cat_name'] = this.name;
    map['slug'] = this.slug;
    return map;
  }

  static Category fromJson(Map<String, dynamic> json) {
    return Category(name: json['cat_name'], id: json['cat_ID'], slug: json['slug']);
  }

  @override
  String toString() {
    return '{Name : ${this.name} , ID : ${this.id}, slug : ${this.slug}}';
  }
}
