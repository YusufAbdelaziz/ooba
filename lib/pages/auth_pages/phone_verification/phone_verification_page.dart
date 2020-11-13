import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common/translation_configuration/app_localizations.dart';
import '../../../utilities/space.dart';
import '../../../utilities/timer/ticker.dart';
import '../../../utilities/timer/timer_bloc.dart';
import '../../../widgets/common/custom_appbar.dart';
import '../../../widgets/common/custom_button.dart';

class PhoneVerificationPage extends StatefulWidget {
  @override
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  StreamController<ErrorAnimationType> _errorController;
  TextEditingController _pinCodeController;
  FocusNode _pinCodeFocusNode;

  @override
  void initState() {
    super.initState();
    _errorController = StreamController<ErrorAnimationType>();
    _pinCodeController = TextEditingController();
    _pinCodeFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerBloc>(
      create: (_) => TimerBloc(
          ticker: Ticker(),
          duration: Duration(
            seconds: 10,
          ).inSeconds)
        ..add(Start()),
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: CustomAppBar(
            title: AppLocalizations.of(context)
                .translate('PhoneVerification.phoneVerification')
                .toUpperCase(),
            backAction: () => Navigator.of(context).pop(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context).translate('PhoneVerification.header'),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(fontSize: 22, fontWeight: FontWeight.w400, height: 1.4),
                              textAlign: TextAlign.center,
                            ),
                            space(height: 10),
                            Text(
                              '123456789',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(fontSize: 22, color: Theme.of(context).primaryColor),
                              textAlign: TextAlign.center,
                            ),
                            space(height: 10),
                            Text(
                              AppLocalizations.of(context).translate('PhoneVerification.subHeader'),
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            space(height: 30),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: PinCodeTextField(
                                appContext: context,
                                length: 4,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.underline,
                                  fieldHeight: 50,
                                  fieldWidth: 40,
                                  activeFillColor: Colors.transparent,
                                  inactiveFillColor: Colors.transparent,
                                  selectedColor: Theme.of(context).primaryColor,
                                  selectedFillColor: Colors.transparent,
                                  inactiveColor: Theme.of(context).primaryColor,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                animationDuration: Duration(milliseconds: 300),
                                backgroundColor: Theme.of(context).backgroundColor,
                                enableActiveFill: true,
                                controller: _pinCodeController,
                                focusNode: _pinCodeFocusNode,
                                errorAnimationController: _errorController,
                                onCompleted: (pinCode) {
                                  /// TODO : Fire pin code validation.
                                },
                                onChanged: (String value) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                          AppLocalizations.of(context)
                              .translate('PhoneVerification.didntReceiveCode'),
                          style: Theme.of(context).textTheme.headline5),
                      space(height: 5),
                      BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
                        final String minutesStr =
                            ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
                        final String secondsStr =
                            (state.duration % 60).floor().toString().padLeft(2, '0');
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    AppLocalizations.of(context)
                                        .translate('PhoneVerification.requestNewCode'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(color: Theme.of(context).primaryColor)),
                                Text(' ' + '$minutesStr:$secondsStr',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(color: Theme.of(context).primaryColor)),
                              ],
                            ),
                            space(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: CustomButton(
                                color: state is Finished
                                    ? Theme.of(context).primaryColor
                                    : Colors.black54,
                                content: Text(
                                  AppLocalizations.of(context)
                                      .translate('PhoneVerification.requestCode'),
                                  style: Theme.of(context).textTheme.button,
                                ),
                                onTap: () {
                                  if (state is Finished) {
                                    BlocProvider.of<TimerBloc>(context).add(Reset());

                                    /// TODO : Send request
                                  }
                                },
                              ),
                            ),
                          ],
                        );
                      }),
                      space(height: 15),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
