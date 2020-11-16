import 'package:Ooba/utilities/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../blocs/main_pages_bloc/favorite_switcher_cubit/favorite_switcher_cubit.dart';
import '../../models/product.dart';
import '../../pages/main_pages/product_detail_page.dart';
import '../../utilities/space.dart';
import '../../widgets/common/favourite_button.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({@required this.product});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteSwitcherCubit>(
      create: (_) => FavoriteSwitcherCubit(),
      child: Builder(
        builder: (context) => InkWell(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () => Navigator.of(context).push(PageTransition(
              type: PageTransitionType.fade,
              child: BlocProvider.value(
                value: BlocProvider.of<FavoriteSwitcherCubit>(context),
                child: ProductDetailPage(
                  product: product,
                ),
              ))),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Theme.of(context).primaryColor, width: 0.8)),
                      child: product.imagesUrl.length != 0 && product.imagesUrl[0] != null
                          ? FadeInImage(
                              placeholder: AssetImage('assets/images/product.png'),
                              image: NetworkImage(product.imagesUrl[0]),
                            )
                          : Image.asset(
                              'assets/images/product.png',
                              fit: BoxFit.contain,
                            )),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: BlocConsumer<FavoriteSwitcherCubit, FavoriteSwitcherState>(
                          listener: (context, state) {
                        if (state is FavoriteSwitchFail) {

                          CustomSnackBar.showSnackBar(
                              context: context,
                              textMsg:
                                  'Setting product as favorite failed, check your internet connection.');
                        }
                      }, builder: (context, state) {
                        bool isFavorite;
                        if (state is FavoriteSwitchSuccess) {
                          isFavorite = state.switchStatus;
                        } else if (state is FavoriteSwitcherInitial) {
                          isFavorite = product.isFavorite;
                        }
                        return FavouriteButton(
                          onClick: () => BlocProvider.of<FavoriteSwitcherCubit>(context)
                              .switchFavorite(product: product),
                          isFavorite: isFavorite,
                          size: 16,
                          radius: 15,
                        );
                      }))
                ],
              ),
              space(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                        )),
                        Text(product.price + " KD"),
                      ],
                    ),
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'By Wahab',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
