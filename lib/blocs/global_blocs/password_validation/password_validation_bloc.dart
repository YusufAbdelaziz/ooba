import 'dart:async';

import 'package:Ooba/common/validators.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

part 'password_validation_event.dart';
part 'password_validation_state.dart';

/// Used to validate password fields in sign up and sign in pages.
class PasswordValidationBloc extends Bloc<PasswordValidationEvent, PasswordValidationState> {
  PasswordValidationBloc() : super(PasswordValidationInitial());

  @override
  Stream<PasswordValidationState> mapEventToState(
    PasswordValidationEvent event,
  ) async* {
    if (event is SignUpPasswordsChecked) {
      if (Validators.isValidPassword(event.password)) {
        if (event.password == event.confirmPassword) {
          yield SignUpPasswordsValid();
        } else {
          yield SignUpPasswordsNotEqual();
        }
      } else {
        yield SignUpPasswordsInvalid();
      }
    } else if (event is SignInPasswordChecked) {
      if (Validators.isValidPassword(event.password)) {
        yield SignInPasswordValid();
      } else {
        yield SignInPasswordInvalid();
      }
    }
  }

  @override
  Stream<Transition<PasswordValidationEvent, PasswordValidationState>> transformEvents(
      Stream<PasswordValidationEvent> events,
      TransitionFunction<PasswordValidationEvent, PasswordValidationState> transitionFn) {
    return super.transformEvents(events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
}
