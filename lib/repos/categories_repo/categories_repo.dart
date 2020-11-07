import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/category.dart';

class CategoriesRepo {

  static final _url = 'https://itsooba.com/wp-admin/admin-ajax.php';

  static Future<List<Category>> fetchCategories() async {
    final response =
        await http.post(_url, body: {'action': 'get_categories',});

    final categories = List<Category>.from(
        json.decode(response.body)['categories'].map((category) => Category.fromJson(category)));

    return categories;
  }

}
