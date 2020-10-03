import 'package:Ooba/pages/main_pages/product_detail_page.dart';
import 'package:Ooba/widgets/common/product_item.dart';
import 'package:Ooba/widgets/main_product_page/custom_drawer.dart';
import 'package:Ooba/widgets/main_product_page/main_products_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
          cartAction: () {},
        ),
        backgroundColor: Colors.black,
        body: ClipRRect(
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: GridView.count(
                crossAxisCount: 2,
                physics: BouncingScrollPhysics(),
                mainAxisSpacing: 20,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                childAspectRatio: 100 / 145,
                padding: EdgeInsets.all(15),
                children: List.generate(
                  50,
                  (index) {
                    return InkWell(
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () => Navigator.of(context).push(PageTransition(
                            type: PageTransitionType.fade, child: ProductDetailPage())),
                        child: ProductItem());
                  },
                )),
          ),
        ),
      ),
    );
  }
}
