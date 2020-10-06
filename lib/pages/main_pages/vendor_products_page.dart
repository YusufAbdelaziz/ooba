import 'package:Ooba/widgets/common/products_grid.dart';
import 'package:Ooba/widgets/main_product_pages/vendor_page_app_bar.dart';
import 'package:flutter/material.dart';

class VendorProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VendorPageAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ProductsGrid(),
      ),
    );
  }
}
