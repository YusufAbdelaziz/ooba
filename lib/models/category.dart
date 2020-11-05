import 'package:flutter/foundation.dart';

class Category {
  final String name;
  final int id;

  Category({@required this.name, @required this.id});

  Map<String, dynamic> toJson() {
    final map = {};
    map['cat_ID'] = this.id;
    map['cat_name'] = this.name;
    return map;
  }

  static Category fromJson(Map<String, dynamic> json) {
    return Category(name: json['cat_name'], id: json['cat_ID']);
  }

  @override
  String toString() {
    return '{Name : ${this.name} , ID : ${this.id}}';
  }
}
