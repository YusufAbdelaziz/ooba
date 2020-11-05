import 'package:Ooba/widgets/common/products_grid.dart';
import 'package:Ooba/widgets/main_product_pages/category_page_app_bar.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  const CategoryPage({@required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryPageAppBar(
        categoryName: categoryName,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ProductsGrid(products: [],),
      ),
    );
  }
}
