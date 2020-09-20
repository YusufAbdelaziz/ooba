import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'password_visibility_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit() : super(PasswordVisibilityInitial());

  void switchVisibility({@required bool isVisible}) {
    emit(PasswordVisibilityInitial());
    emit(SwitchPasswordVisibility(isVisible: isVisible));
  }
}