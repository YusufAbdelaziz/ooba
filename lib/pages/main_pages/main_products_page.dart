import 'package:Ooba/widgets/common/products_grid.dart';
import 'package:Ooba/widgets/main_product_pages/custom_drawer.dart';
import 'package:Ooba/widgets/main_product_pages/main_products_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'order_details_page.dart';

class MainProductsPage extends StatefulWidget {
  @override
  _MainProductsPageState createState() => _MainProductsPageState();
}

class _MainProductsPageState extends State<MainProductsPage> {
  TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: MainProductsAppBar(
          searchController: _searchController,
          cartAction: () => Navigator.of(context)
              .push(PageTransition(type: PageTransitionType.fade, child: OrderDetailsPage())),
        ),
        backgroundColor: Colors.black,
        body: ClipRRect(
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: ProductsGrid(),
          ),
        ),
      ),
    );
  }
}
