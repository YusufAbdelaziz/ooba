import 'package:Ooba/common/translation_configuration/app_localizations.dart';
import 'package:Ooba/widgets/common/custom_appbar.dart';
import 'package:Ooba/widgets/common/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).translate('ProductDetails.productDetails'),
        backAction: () => Navigator.of(context).pop(),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 200,
            width: width,
            height: height / 2,
            child: PhotoViewGallery.builder(
                itemCount: 5,
                builder: (context, i) => PhotoViewGalleryPageOptions(
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 1.1,
                    heroAttributes: PhotoViewHeroAttributes(tag: i),
                    imageProvider: AssetImage('assets/images/model.png'))),
          ),
          Positioned(
              left: 22,
              top: 22,
              child: FavouriteButton(
                radius: 20,
                size: 16,
              )),
          Positioned(
            top: height / 2.1,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20), topLeft: Radius.circular(20))),
              width: width,
              height: height / 2,
            ),
          )
        ],
      ),
    );
  }
}
