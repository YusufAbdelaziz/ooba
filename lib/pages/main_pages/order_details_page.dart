import 'package:Ooba/blocs/address_cubit/address_cubit.dart';
import 'package:Ooba/blocs/cart_bloc/cart_bloc.dart';
import 'package:Ooba/blocs/checkout/checkout_cubit.dart';
import 'package:Ooba/pages/address/my_address_page.dart';
import 'package:Ooba/repos/user_repo.dart';
import 'package:Ooba/utilities/error_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../common/translation_configuration/app_localizations.dart';
import '../../utilities/space.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/common/custom_button.dart';
import 'order_placed_page.dart';

class OrderDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(create: (context) {
          return CartBloc()..add(LoadCart());
        }),
        BlocProvider<CheckoutCubit>(create: (context) {
          return CheckoutCubit();
        }),
      ],
      child: Builder(
          builder: (context) => Scaffold(
                appBar: CustomAppBar(
                  title: AppLocalizations.of(context).translate('OrderDetails.orderDetails'),
                  backAction: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Theme.of(context).backgroundColor,
                body: BlocListener<CheckoutCubit, CheckoutState>(
                  listener: (context, state) async {
                    if (state is CheckoutFail) {
                      errorSnackBar(state.text, context);
                    } else if (state is Checkout) {
                      Navigator.of(context).push(
                          PageTransition(child: OrderPlacedPage(), type: PageTransitionType.fade));
                    }
                  },
                  child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                    if (state is CartLoaded)
                      return SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .translate('OrderDetails.orderDetails')
                                  .toUpperCase(),
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            space(height: 10),
                            ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.items.length,
                                separatorBuilder: (context, i) => space(height: 8),
                                itemBuilder: (context, i) => Row(
                                      children: [
                                        Image.network(
                                          state.items[i].product.imagesUrl[0],
                                          height: 60,
                                          width: 60,
                                        ),
                                        space(width: 20),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(width : 250,
                                                child: Text(
                                              state.items[i].product.title,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                            space(height: 10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "\$${state.items[i].product.price * state.items[i].quantity.toDouble()}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      .copyWith(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w300),
                                                ),
                                                Text(
                                                  "  X" + state.items[i].quantity.toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      .copyWith(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w300),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                            space(height: 20),
                            Divider(
                              thickness: 1,
                              height: 1,
                              color: Theme.of(context).primaryColor,
                            ),
                            space(height: 15),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('OrderDetails.deliverTo')
                                          .toUpperCase(),
                                      style: Theme.of(context).textTheme.headline4,
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.of(context).push(PageTransition(
                                          type: PageTransitionType.fade,
                                          child: BlocProvider.value(
                                              value: BlocProvider.of<AddressCubit>(context),
                                              child: MyAddressPage()))),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.only(
                                            top: 8, bottom: 8, start: 8),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .translate('OrderDetails.change'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              .copyWith(color: Theme.of(context).primaryColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                space(height: 10),
                                BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
                                  final defaultAddress = UserRepo.getUser().defaultAddress;
                                  return Text(
                                    '${defaultAddress.country},  ${defaultAddress.city}, ${defaultAddress.addressLine1}',
                                    maxLines: 3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(color: Colors.black),
                                  );
                                }),
                                space(height: 20),
                                Divider(
                                  thickness: 1,
                                  height: 1,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                            space(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)
                                      .translate('OrderDetails.shippingMethod')
                                      .toUpperCase(),
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                space(height: 10),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(end: 15),
                                      child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Radio<String>(
                                          onChanged: (value) {},
                                          value: 'Standard Shipping',
                                          groupValue: 'Standard Shipping',
                                          activeColor: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    Text('Standard Shipping (16 Days)'),
                                    Spacer(),
                                    Text(
                                      AppLocalizations.of(context).translate('OrderDetails.free'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          .copyWith(color: Theme.of(context).primaryColor),
                                    ),
                                  ],
                                ),
                                space(height: 20),
                                Divider(
                                  thickness: 1,
                                  height: 1,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                            space(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)
                                      .translate('OrderDetails.subtotal')
                                      .toUpperCase(),
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text('\$768.00', style: Theme.of(context).textTheme.headline2)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)
                                      .translate('OrderDetails.shipping')
                                      .toUpperCase(),
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text('\$4.00', style: Theme.of(context).textTheme.headline2)
                              ],
                            ),
                            space(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context).translate('OrderDetails.total'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(fontSize: 20, fontWeight: FontWeight.w300),
                                ),
                                Text('\$772.00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .copyWith(fontSize: 20, fontWeight: FontWeight.w300))
                              ],
                            ),
                            space(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: BlocBuilder<CheckoutCubit, CheckoutState>(
                                  builder: (context, state) {
                                if (state is LoadingCheckout)
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    height: 44,
                                    color: Theme.of(context).primaryColor,
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
                                return CustomButton(
                                  onTap: () {
                                    // TODO: change 1 with address id
                                    BlocProvider.of<CheckoutCubit>(context)
                                        .checkout(UserRepo.getUser().defaultAddress.id);
                                  },
                                  color: Theme.of(context).primaryColor,
                                  content: Text(
                                    AppLocalizations.of(context)
                                        .translate('OrderDetails.placeTheOrder'),
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                );
                              }),
                            ),
                            space(height: 10),
                          ],
                        ),
                      );
                    return Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          backgroundColor: Theme.of(context).primaryColor,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    );
                  }),
                ),
              )),
    );
  }
}
