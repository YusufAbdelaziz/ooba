import 'dart:async';

import 'package:Ooba/common/validators.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

part 'email_username_validation_event.dart';
part 'email_username_validation_state.dart';

/// Used to validate username and email in sign in and sign up pages.
class EmailUsernameValidationBloc
    extends Bloc<EmailUsernameValidationEvent, EmailUsernameValidationState> {
  EmailUsernameValidationBloc() : super(EmailValidationInitial());

  @override
  Stream<EmailUsernameValidationState> mapEventToState(
    EmailUsernameValidationEvent event,
  ) async* {
    if (event is EmailChecked) {
      if (Validators.isValidEmail(event.email)) {
        yield EmailValid();
      } else {
        yield EmailInvalid();
      }
    } else if (event is UsernameChecked) {
      if (Validators.isUsernameValid(event.username)) {
        yield UsernameValid();
      } else {
        yield UsernameInvalid();
      }
    } else if (event is UsernameEmailChecked) {
      if (Validators.isUsernameValid(event.usernameEmail)) {
        yield UsernameEmailValid();
      } else {
        yield UsernameEmailInvalid();
      }
    }
  }

  @override
  Stream<Transition<EmailUsernameValidationEvent, EmailUsernameValidationState>> transformEvents(
      Stream<EmailUsernameValidationEvent> events,
      TransitionFunction<EmailUsernameValidationEvent, EmailUsernameValidationState> transitionFn) {
    return super.transformEvents(events.debounceTime(Duration(milliseconds: 300)), transitionFn);
  }
}
