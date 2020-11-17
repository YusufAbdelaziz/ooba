import 'package:flutter/material.dart';

typedef void CustomAction();

class MainProductsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CustomAction cartAction;
  final TextEditingController searchController;
  const MainProductsAppBar({@required this.cartAction, @required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: kToolbarHeight),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => Scaffold.of(context).openDrawer(),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.dehaze,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/ooba_icon.png',
                width: 40,
                height: 40,
              ),
              InkWell(
                onTap: cartAction,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/cart.png',
                    height: 22,
                    width: 22,
                  ),
                ),
              ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 40),
          //   child: TextField(
          //     controller: searchController,
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodyText1
          //         .copyWith(color: Theme.of(context).primaryColor, fontSize: 16, height: 1.2),
          //     decoration: InputDecoration(
          //       contentPadding: EdgeInsets.only(top: 10),
          //       enabledBorder: UnderlineInputBorder(
          //         borderSide: BorderSide(color: Theme.of(context).primaryColor),
          //       ),
          //       prefixIconConstraints: BoxConstraints(minWidth: 10, minHeight: 0),
          //       prefixIcon: Padding(
          //         padding: const EdgeInsetsDirectional.only(end: 8,top: 10),
          //         child: Image.asset(
          //           'assets/images/search_icon.png',
          //           width: 15,
          //           height: 15,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  /// Return it to 140 when search bar is needed.
  @override
  Size get preferredSize => Size(double.infinity, 100);
}
