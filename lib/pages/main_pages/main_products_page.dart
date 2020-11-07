import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../blocs/main_pages_bloc/products_bloc/products_bloc.dart';
import '../../widgets/common/product_item.dart';
import '../../widgets/main_product_pages/custom_drawer.dart';
import '../../widgets/main_product_pages/custom_loading_indicator.dart';
import '../../widgets/main_product_pages/main_products_app_bar.dart';
import 'order_details_page.dart';

class MainProductsPage extends StatefulWidget {
  @override
  _MainProductsPageState createState() => _MainProductsPageState();
}

class _MainProductsPageState extends State<MainProductsPage> {
  TextEditingController _searchController;
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.removeListener(() => _onScroll(context));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        drawer: CustomDrawer(),
        appBar: MainProductsAppBar(
          searchController: _searchController,
          cartAction: () => Navigator.of(context)
              .push(PageTransition(type: PageTransitionType.fade, child: OrderDetailsPage())),
        ),
        backgroundColor: Colors.black,
        body: ClipRRect(
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: BlocConsumer<ProductsBloc, ProductsState>(
              listener: (context, state) {
                if (state is ProductsFetchFail) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(state.text),
                    action: SnackBarAction(
                        label: 'Close',
                        onPressed: () => Scaffold.of(context).hideCurrentSnackBar()),
                  ));
                }
              },
              builder: (context, state) {
                if (state is ProductsFetchSuccess) {
                  return RefreshIndicator(
                      onRefresh: () async =>
                          BlocProvider.of<ProductsBloc>(context).add(ProductsFetched()),
                      color: Theme.of(context).primaryColor,
                      child: GridView.builder(
                        controller: _scrollController..addListener(() => _onScroll(context)),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            state.hasReachedMax ? state.products.length : state.products.length + 2,
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
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void _onScroll(BuildContext context) {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= 1000 && maxScroll - currentScroll >= 950) {
      BlocProvider.of<ProductsBloc>(context).add(ProductsFetched());
    }
  }
}
