import 'package:Ooba/blocs/global_blocs/auth/auth_cubit.dart';
import 'package:Ooba/blocs/global_blocs/email_username_validation/email_username_validation_bloc.dart';
import 'package:Ooba/common/translation_configuration/app_localizations.dart';
import 'package:Ooba/utilities/space.dart';
import 'package:Ooba/widgets/auth_pages/custom_auth_header.dart';
import 'package:Ooba/widgets/auth_pages/custom_button.dart';
import 'package:Ooba/widgets/common/custom_appbar.dart';
import 'package:Ooba/widgets/common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  var _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<AuthCubit>(context).signInSwitched();
        return false;
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<EmailUsernameValidationBloc>(
            create: (_) => EmailUsernameValidationBloc(),
          )
        ],
        child: Builder(
          builder: (context) => Scaffold(
            appBar: CustomAppBar(
              title: AppLocalizations.of(context).translate('ForgetPassword.resetPassword'),
              backAction: () => BlocProvider.of<AuthCubit>(context).signInSwitched(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomAuthHeader(
                          title: AppLocalizations.of(context)
                              .translate('ForgetPassword.forgotYourPassword'),
                          subTitle:
                              AppLocalizations.of(context).translate('ForgetPassword.instructions'),
                        ),
                        space(height: 20),
                        BlocBuilder<EmailUsernameValidationBloc, EmailUsernameValidationState>(
                            builder: (context, state) {
                          String emailErrorTxt;
                          if (state is EmailInvalid) {
                            emailErrorTxt = AppLocalizations.of(context)
                                .translate('ForgetPassword.emailInvalid');
                          }
                          return CustomTextField(
                            controller: _emailController,
                            inputType: TextInputType.emailAddress,
                            errorText: emailErrorTxt,
                            onChanged: (email) =>
                                BlocProvider.of<EmailUsernameValidationBloc>(context)
                                    .add(EmailChecked(email: email)),
                            labelText:
                                AppLocalizations.of(context).translate('ForgetPassword.email'),
                          );
                        }),
                        space(height: 35),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: CustomButton(
                            onTap: () => BlocProvider.of<AuthCubit>(context).checkEmailSwitched(),
                            label: AppLocalizations.of(context)
                                .translate('ForgetPassword.resetPassword'),
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
