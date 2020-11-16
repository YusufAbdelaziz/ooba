import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../widgets/common/products_grid.dart';
import '../../widgets/main_product_pages/category_page_app_bar.dart';

class CategoryPage extends StatelessWidget {
  final Category category;

  const CategoryPage({@required this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryPageAppBar(
        categoryName: category.name,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ProductsGrid(
          slug: category.slug,
        ),
      ),
    );
  }
}
