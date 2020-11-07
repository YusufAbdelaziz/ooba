import 'package:flutter/material.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/common/products_grid.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).translate('Drawer.favoriteProducts'),
        backAction: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ProductsGrid(
          products: [],
        ),
      ),
    );
  }
}
