import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../pages/main_pages/order_details_page.dart';

class CategoryPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String categoryName;

  const CategoryPageAppBar({@required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kToolbarHeight - 30,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                icon: Image.asset(
                  'assets/images/cart.png',
                  width: 20,
                  height: 20,
                ),
                onPressed: () => Navigator.of(context)
                    .push(PageTransition(type: PageTransitionType.fade, child: OrderDetailsPage())),
              ),
            ],
          ),
          Text(
            categoryName,
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(fontWeight: FontWeight.w400, fontSize: 20, height: 1),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 90);
}
