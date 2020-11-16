import 'package:Ooba/utilities/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/main_pages_bloc/products_bloc/products_bloc.dart';
import '../main_product_pages/custom_loading_indicator.dart';
import 'product_item.dart';

class ProductsGrid extends StatefulWidget {
  /// Slug of a category to show categorized products.
  final String slug;

  const ProductsGrid({this.slug});
  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.removeListener(() => _onScroll(context));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
        create: (_) => ProductsBloc(slug: widget.slug)..add(ProductsFetched()),
        child: Builder(
            builder: (context) => BlocConsumer<ProductsBloc, ProductsState>(
                  listener: (context, state) {
                    if (state is ProductsFetchFail) {
                      CustomSnackBar.showSnackBar(context: context, textMsg: state.text);
                    }
                  },
                  builder: (context, state) {
                    if (state is ProductsFetchSuccess) {
                      return RefreshIndicator(
                          onRefresh: () async =>
                              BlocProvider.of<ProductsBloc>(context).add(ProductsReloaded()),
                          color: Theme.of(context).primaryColor,
                          child: GridView.builder(
                            controller: _scrollController..addListener(() => _onScroll(context)),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.hasReachedMax
                                ? state.products.length
                                : state.products.length + 2,
                            padding: EdgeInsets.all(15),
                            itemBuilder: (context, index) {
                              return index >= state.products.length
                                  ? CustomLoadingIndicator()
                                  : ProductItem(
                                      product: state.products[index],
                                    );
                            },
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                              crossAxisCount: 2,
                              childAspectRatio: 100 / 145,
                            ),
                          ));
                    } else if (state is LoadingProducts) {
                      return CustomLoadingIndicator();
                    } else if (state is ProductsFetchFail) {
                      return RefreshIndicator(
                          onRefresh: () async =>
                              BlocProvider.of<ProductsBloc>(context).add(ProductsReloaded()),
                          color: Theme.of(context).primaryColor,
                          child: ListView());
                    } else {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      );
                    }
                  },
                )));
  }

  void _onScroll(BuildContext context) {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= 1000 && maxScroll - currentScroll >= 950) {
      BlocProvider.of<ProductsBloc>(context).add(ProductsFetched());
    }
  }
}
