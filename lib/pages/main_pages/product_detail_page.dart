import 'dart:math';

import 'package:Ooba/blocs/cart_bloc/cart_bloc.dart';
import 'package:Ooba/blocs/counter_bloc/counter_bloc.dart';
import 'package:Ooba/models/product.dart';
import 'package:Ooba/repos/user_repo/user_repo.dart';
import 'package:Ooba/utilities/error_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../../blocs/global_blocs/state_handler_cubit/state_handler_cubit.dart';
import '../../blocs/main_pages_bloc/gallery_switcher_cubit/gallery_switcher_cubit.dart';
import '../../common/translation_configuration/app_localizations.dart';
import '../../pages/main_pages/vendor_products_page.dart';
import '../../utilities/space.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/favourite_button.dart';
import '../../widgets/common/vendor_tile.dart';
import '../../widgets/main_product_pages/gallery_photo_view_wrapper.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print(UserRepo.getUser().token);
    return MultiBlocProvider(
      providers: [
        BlocProvider<GallerySwitcherCubit>(create: (_) => GallerySwitcherCubit()),
        BlocProvider<StateHandlerCubit>(create: (_) => StateHandlerCubit()..valueSwitched(value: true)),
        BlocProvider<CounterBloc>(create: (context) {
          return CounterBloc(1);
        }),
        BlocProvider<CartBloc>(create: (context) {
          return CartBloc();
        }),
      ],
      child: Builder(
        builder: (context) => Scaffold(
          bottomSheet: SolidBottomSheet(
            showOnAppear: true,
            maxHeight: height / 1.7,
            onHide: () => BlocProvider.of<StateHandlerCubit>(context).valueSwitched(value: false),
            onShow: () => BlocProvider.of<StateHandlerCubit>(context).valueSwitched(value: true),
            minHeight: 10,
            headerBar: Container(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              color: Theme.of(context).backgroundColor,
              child: BlocBuilder<StateHandlerCubit, StateHandlerState>(
                builder: (context, state) => Transform.rotate(
                  angle: state.value ? pi * 3 / 2 : pi / 2,
                  child: Icon(
                    Icons.arrow_back_ios,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () => Navigator.of(context)
                              .push(PageTransition(child: VendorProductsPage(), type: PageTransitionType.fade)),
                          child: VendorTile()),
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 30.0, right: 15),
                            child: AutoSizeText(
                              product.name ?? '',
                              minFontSize: 16,
                              style: Theme.of(context).textTheme.headline1.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  space(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AutoSizeText(
                        product.price + ' KD ',
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: Theme.of(context).primaryColor, fontSize: 20),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () => BlocProvider.of<CounterBloc>(context).add(CounterEvent.increment),
                            ),
                            Spacer(),
                            BlocBuilder<CounterBloc, int>(builder: (context, count) {
                              return Text(
                                '$count',
                                style: Theme.of(context).textTheme.bodyText1,
                              );
                            }),
                            Spacer(),
                            IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: () => BlocProvider.of<CounterBloc>(context).add(CounterEvent.decrement),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  space(height: 10),
                  AutoSizeText(AppLocalizations.of(context).translate('ProductDetails.description'),
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontWeight: FontWeight.w400,
                          )),
                  space(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: AutoSizeText(
                        product.description,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.w200,
                            ),
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      ),
                    ),
                  ),
                  space(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                      if(state is LoadingCart)
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 44,
                          color: Theme
                              .of(context)
                              .primaryColor,
                          child: Row(
                            children: [
                              Spacer(),
                              CircularProgressIndicator(
                                backgroundColor: Theme.of(context).primaryColor,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                              Spacer(),
                            ],
                          ),
                        );
                      return BlocBuilder<CounterBloc, int>(builder: (context, count) {
                        return CustomButton(
                          content: Text(
                            AppLocalizations.of(context).translate('ProductDetails.addToCart'),
                            style: Theme
                                .of(context)
                                .textTheme
                                .button,
                          ),
                          onTap: () {
                            BlocProvider.of<CartBloc>(context).add(AddToCart(id: product.id, quantity: count));
                          },
                          color: Theme
                              .of(context)
                              .primaryColor,
                        );
                      });
                    }),
                  )
                ],
              ),
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: CustomAppBar(
            title: AppLocalizations.of(context).translate('ProductDetails.productDetails'),
            backAction: () => Navigator.of(context).pop(),
          ),
          body: BlocListener<CartBloc, CartState>(
            listener: (context, state) async {
              if (state is CartFail) {
                errorSnackBar(state.text, context);
              }
              else if (state is ProductAddedToCart) {
                Navigator.of(context).pop();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("This product added successfully"),
                    backgroundColor: Colors.lightGreen,
                  ),
                );
              }
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  width: width,
                  top: -50,
                  child: CarouselSlider.builder(
                      itemCount: product.imagesUrl.isEmpty ? 1 : product.imagesUrl.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () => open(context, i),
                          child: product.imagesUrl.isNotEmpty
                              ? product.imagesUrl[i] != null
                                  ? Image.network(
                                      product.imagesUrl[i],
                                      fit: BoxFit.fitHeight,
                                    )
                                  : Image.asset(
                                      'assets/images/product.png',
                                      fit: BoxFit.contain,
                                    )
                              : Image.asset(
                                  'assets/images/product.png',
                                  fit: BoxFit.contain,
                                ),
                        );
                      },
                      options: CarouselOptions(
                          height: height / 2,
                          onPageChanged: (index, reason) =>
                              BlocProvider.of<GallerySwitcherCubit>(context).thumbnailBorderSwitched(index: index))),
                ),
                Positioned(
                    left: 22,
                    top: 22,
                    child: FavouriteButton(
                      radius: 20,
                      size: 16,
                    )),
                BlocBuilder<GallerySwitcherCubit, int>(
                  builder: (context, state) => Positioned(
                    height: 30,
                    top: height / 3.2,
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, i) => space(width: 5),
                      scrollDirection: Axis.horizontal,
                      itemCount: product.imagesUrl.length,
                      itemBuilder: (context, i) => Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: state == i ? Colors.white : Colors.transparent),
                          ),
                          child: product.imagesUrl[i] != null
                              ? Image.network(product.imagesUrl[i])
                              : Image.asset(
                                  'assets/images/product.png',
                                )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.of(context).push(
      PageTransition(
        type: PageTransitionType.fade,
        child: GalleryPhotoViewWrapper(
          galleryItems: product.imagesUrl,
          backgroundDecoration: const BoxDecoration(
            color: Colors.white,
          ),
          initialIndex: index,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
