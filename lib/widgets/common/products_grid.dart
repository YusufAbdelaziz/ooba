import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../pages/main_pages/product_detail_page.dart';
import '../../widgets/common/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
                onTap: () => Navigator.of(context).push(
                    PageTransition(type: PageTransitionType.fade, child: ProductDetailPage())),
                child: ProductItem());
          },
        ));
  }
}