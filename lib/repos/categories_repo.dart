import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/category.dart';

class CategoriesRepo {
  static final _url = '';

  /// Fetches the categories in the side menu, if it's already loaded, then would be fetched from
  /// shared preference, otherwise make a request to fetch them.
  static Future<List<Category>> fetchCategories() async {
    List<Category> categories;
    final sharedPreference = await SharedPreferences.getInstance();
    if (sharedPreference.containsKey('categories')) {
      categories = List<Category>.from(json
          .decode(sharedPreference.getString('categories'))
          .map((category) => Category.fromJson(category))
          .toList());
    } else {
      // final response = await http.post(_url, body: {
      //   'action': 'get_categories',
      // });
      categories = List<Category>.from(
          generateDummyCategories().map((category) => Category.fromJson(category)));
      await sharedPreference.setString(
          'categories', json.encode(categories.map((category) => category.toJson()).toList()));
    }
    return categories;
  }

  static Future<void> clearCategories() async {
    final sharedPreference = await SharedPreferences.getInstance();
    if (sharedPreference.containsKey('categories')) {
      sharedPreference.remove('categories');
    }
  }
}

List<Map<String, dynamic>> generateDummyCategories() {
  return List.generate(6, (index) => <String,dynamic>{
    'cat_id' : index,
    'cat_name': 'random cat $index',
    'slug' : 'random cat $index',
  });
}
