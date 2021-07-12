import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(
      {@required String usernameOrEmail,
      @required String password,
      @required bool isRemembered}) async {
    emit(LoginLoading());
    try {
      await AuthRepo.login(
          isAuthenticated: true,
          usernameOrEmail: usernameOrEmail,
          password: password,
          isRemembered: isRemembered);
      emit(LoginSuccess());
    } catch (e, stacktrace) {
      print(stacktrace);
      emit(LoginFail(errorMsg: e));
    }
  }

  void signUp(
      {@required String username,
      @required String email,
      @required String password,
      @required String phone,
      @required String confirmPassword}) async {
    emit(SignUpLoading());
    try {
      await AuthRepo.signUp(
          isAuthenticated: true,
          confirmPassword: confirmPassword,
          email: email,
          password: password,
          phone: phone,
          username: username);
      emit(SignUpSuccess());
    } catch (e, stacktrace) {
      print(stacktrace);
      emit(SignUpFail(errorMsg: e));
    }
  }

  void logout() async {
    emit(LogoutLoading());
    try {
      await AuthRepo.logout();
      emit(LogoutSuccess());
    } catch (e, stacktrace) {
      print(stacktrace);
      emit(LogoutFail(errorMsg: e));
    }
  }
}
