// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:Ooba/repos/products_repo/products_repo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testing API', () async {
    final list = await ProductsRepo.fetchProducts(page: 2);
    print(list);
  });
}
