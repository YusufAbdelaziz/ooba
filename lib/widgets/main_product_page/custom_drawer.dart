import 'package:flutter/material.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../utilities/space.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.centerEnd,
            margin: EdgeInsets.only(top: 25),
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close),
            ),
          ),
          InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    radius: 45,
                    child: Image.asset('assets/images/ooba_icon.png'),
                  ),
                ),
                Positioned(
                    top: 70,
                    right: 55,
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Image.asset('assets/images/camera.png'),
                    ))
              ],
              alignment: Alignment.center,
            ),
          ),
          space(height: 15),
          Text(
            'Mike',
            style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 20),
          ),
          Text('mil@gmail.com',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.grey.withOpacity(0.7))),
          Expanded(
              child: Scrollbar(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  space(height: 15),
                  DrawerItem(
                    name: AppLocalizations.of(context).translate('Drawer.men'),
                    onTap: () {},
                  ),
                  DrawerItem(
                    name: AppLocalizations.of(context).translate('Drawer.women'),
                    onTap: () {},
                  ),
                  DrawerItem(
                    name: AppLocalizations.of(context).translate('Drawer.youth'),
                    onTap: () {},
                  ),
                  DrawerItem(
                    name: AppLocalizations.of(context).translate('Drawer.kids'),
                    onTap: () {},
                  ),
                  DrawerItem(
                    name: AppLocalizations.of(context).translate('Drawer.orderHistory'),
                    onTap: () {},
                  ),
                  DrawerItem(
                    name: AppLocalizations.of(context).translate('Drawer.notification'),
                    onTap: () {},
                  ),
                  DrawerItem(
                    name: AppLocalizations.of(context).translate('Drawer.favoriteProducts'),
                    onTap: () {},
                  ),
                  DrawerItem(
                    name: AppLocalizations.of(context).translate('Drawer.settings'),
                    onTap: () {},
                  ),
                  space(height: 10),
                ],
              ),
            ),
          )),
          InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {},
            child: Container(
              height: 60,
              color: Theme.of(context).primaryColor,
              child: Row(textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context).translate('Drawer.logout')),
                  space(width: 10),
                  Image.asset(
                    'assets/images/logout.png',
                    height: 22,
                    width: 22,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
