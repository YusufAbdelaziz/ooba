import 'package:Ooba/blocs/global_blocs/auth/auth_cubit.dart';
import 'package:Ooba/common/translation_configuration/app_localizations.dart';
import 'package:Ooba/utilities/space.dart';
import 'package:Ooba/widgets/auth_pages/custom_auth_header.dart';
import 'package:Ooba/widgets/auth_pages/custom_button.dart';
import 'package:Ooba/widgets/common/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailCheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<AuthCubit>(context).forgetPasswordSwitched();
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppLocalizations.of(context).translate('EmailCheck.checkYourEmail'),
          backAction: () => BlocProvider.of<AuthCubit>(context).forgetPasswordSwitched(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/send_group.png',
                height: 120,
                width: 120,
              ),
              space(height: 40),
              CustomAuthHeader(
                title: AppLocalizations.of(context).translate('EmailCheck.checkYourEmail'),
                subTitle: AppLocalizations.of(context).translate('EmailCheck.instructions'),
              ),
              space(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    CustomButton(
                      onTap: () {},
                      color: Theme.of(context).primaryColor,
                      label: AppLocalizations.of(context).translate('EmailCheck.openMyMail'),
                    ),
                    CustomButton(
                      onTap: () => BlocProvider.of<AuthCubit>(context).signInSwitched(),
                      color: Theme.of(context).primaryColor,
                      label: AppLocalizations.of(context).translate('EmailCheck.returnToSignIn'),
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
