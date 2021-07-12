import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../../../repos/products_repo.dart';

part 'favorite_switcher_state.dart';

/// Cubit to update favorite state for each product item. Important thing to note, I'm using an
/// optimistic approach for updating, which means updating the state and update it in reverse
/// if the request fails.

class FavoriteSwitcherCubit extends Cubit<FavoriteSwitcherState> {
  FavoriteSwitcherCubit() : super(FavoriteSwitcherInitial());

  void switchFavorite({@required Product product}) async {
    try {
      product.isFavorite = !product.isFavorite;
      emit(FavoriteSwitcherInitial());
      emit(FavoriteSwitchSuccess(switchStatus: product.isFavorite));
      print('i am requesting a favorite update now');
      await ProductsRepo.favoriteProduct(productId: product.id);
      print('finished updating favorite !');
    } catch (e, stacktrace) {
      print(stacktrace);
      product.isFavorite = !product.isFavorite;
      emit(FavoriteSwitchFail());
      emit(FavoriteSwitchSuccess(switchStatus: product.isFavorite));
    }
  }
}
