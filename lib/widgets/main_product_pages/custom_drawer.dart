import 'package:Ooba/blocs/address_cubit/address_cubit.dart';
import 'package:Ooba/blocs/global_blocs/auth/auth_cubit.dart';
import 'package:Ooba/blocs/global_blocs/main_cubit/main_cubit.dart';
import 'package:Ooba/pages/main_pages/settings_page.dart';
import 'package:Ooba/repos/user_repo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../blocs/main_pages_bloc/side_menu_cubit/side_menu_cubit.dart';
import '../../common/translation_configuration/app_localizations.dart';
import '../../pages/main_pages/category_page.dart';
import '../../utilities/space.dart';
import 'custom_loading_indicator.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  final _user = UserRepo.getUser();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SideMenuCubit>(
      create: (_) => SideMenuCubit()..getCategories(),
      child: Builder(
        builder: (context) => Drawer(
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.centerEnd,
                margin: EdgeInsets.only(top: 25),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close),
                ),
              ),
              InkWell(
                onTap: () {},
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.1),
                        radius: 45,
                        child: Image.asset('assets/images/ooba_icon.png'),
                      ),
                    ),
                    // Positioned(
                    //     top: 70,
                    //     right: 55,
                    //     child: CircleAvatar(
                    //       radius: 17,
                    //       backgroundColor: Theme.of(context).primaryColor,
                    //       child: Image.asset('assets/images/camera.png'),
                    //     ))
                  ],
                  alignment: Alignment.center,
                ),
              ),
              space(height: 15),
              Text(
                _user.name,
                style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 20),
              ),
              Text(_user.email,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.grey.withOpacity(0.7))),
              space(height: 20),
              BlocBuilder<SideMenuCubit, SideMenuState>(
                builder: (context, state) {
                  if (state is LoadingCategories) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomLoadingIndicator(),
                    );
                  } else if (state is CategoriesFetch) {
                    return Expanded(
                        child: Scrollbar(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        itemCount: state.categories.length + 1,
                        itemBuilder: (context, i) => i == state.categories.length
                            ? DrawerItem(
                                name: AppLocalizations.of(context).translate('Drawer.settings'),
                                onTap: () => Navigator.of(context).push(PageTransition(
                                    type: PageTransitionType.fade,
                                    child: BlocProvider.value(
                                        value: BlocProvider.of<AddressCubit>(context),
                                        child: SettingsPage()))),
                              )
                            : DrawerItem(
                                name: state.categories[i].name,
                                onTap: () => Navigator.of(context).push(PageTransition(
                                    type: PageTransitionType.fade,
                                    child: CategoryPage(
                                      category: state.categories[i],
                                    ))),
                              ),
                      ),
                    ));
                  } else {
                    return Container(
                      width: 0,
                      height: 0,
                    );
                  }
                },
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LogoutSuccess) {
                    BlocProvider.of<MainCubit>(context).switchAuthPages();
                  }
                },
                builder: (context, state) {
                  return Container(
                    height: 60,
                    color: Theme.of(context).primaryColor,
                    child: state is LogoutLoading
                        ? CustomLoadingIndicator(
                            verticalPadding: 5,
                            color: Colors.white,
                          )
                        : InkWell(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => BlocProvider.of<AuthCubit>(context).logout(),
                            child: Row(
                              textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppLocalizations.of(context).translate('Drawer.logout')),
                                space(width: 10),
                                Image.asset(
                                  'assets/images/logout.png',
                                  height: 22,
                                  width: 22,
                                )
                              ],
                            ),
                          ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
