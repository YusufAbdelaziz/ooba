import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/product.dart';
import '../../../repos/products_repo/products_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  int _page = 0;
  ProductsBloc() : super(LoadingProducts());

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    var currentState = state;
    if (event is ProductsFetched && !_hasReachedMax(currentState)) {
      print('i aaam fetching nigga');
      try {
        if (currentState is LoadingProducts) {
          final products = await ProductsRepo.fetchProducts(page: _page);
          yield ProductsFetchSuccess(products: products, hasReachedMax: false);
          _page++;
          print('Page --> $_page');
        } else if (currentState is ProductsFetchSuccess) {
          final products = await ProductsRepo.fetchProducts(page: _page);
          yield (products.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : currentState.copyWith(
                  hasReachedMax: false, products: currentState.products + products));
          _page++;
          print('Page --> $_page');
        }
      } catch (e, stacktrace) {
        print(stacktrace);
        print(e);
        yield ProductsFetchFail(text: e.toString());
      }
    } else if (event is ProductsReloaded) {
      yield(LoadingProducts());
      _page = 0;
      add(ProductsFetched());
    }
  }


  bool _hasReachedMax(ProductsState state) => state is ProductsFetchSuccess && state.hasReachedMax;

  @override
  Stream<Transition<ProductsEvent, ProductsState>> transformEvents(
      Stream<ProductsEvent> events, TransitionFunction<ProductsEvent, ProductsState> transitionFn) {
    return super.transformEvents(events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
}
