import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../blocs/address_cubit/address_cubit.dart';
import '../../repos/user_repo/user_repo.dart';
import '../../widgets/common/products_grid.dart';
import '../../widgets/main_product_pages/custom_drawer.dart';
import '../../widgets/main_product_pages/main_products_app_bar.dart';
import 'order_details_page.dart';

class MainProductsPage extends StatefulWidget {
  @override
  _MainProductsPageState createState() => _MainProductsPageState();
}

class _MainProductsPageState extends State<MainProductsPage> {
  TextEditingController _searchController;
  final _user = UserRepo.getUser();
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddressCubit>(
      create: (_) => AddressCubit()..fetchAddresses(token: _user.token),
      child: Builder(
        builder: (context) => Scaffold(
          drawer: CustomDrawer(),
          appBar: MainProductsAppBar(
            searchController: _searchController,
            cartAction: () => Navigator.of(context).push(PageTransition(
                type: PageTransitionType.fade,
                child: BlocProvider.value(
                    value: BlocProvider.of<AddressCubit>(context), child: OrderDetailsPage()))),
          ),
          backgroundColor: Colors.black,
          body: ClipRRect(
            borderRadius:
                BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            child: Container(
              color: Theme.of(context).backgroundColor,
              child: ProductsGrid(),
            ),
          ),
        ),
      ),
    );
  }
}
