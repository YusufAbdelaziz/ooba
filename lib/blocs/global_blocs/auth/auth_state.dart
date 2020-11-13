part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginFail extends AuthState {
  final dynamic errorMsg;

  LoginFail({this.errorMsg});
  @override
  List<Object> get props => [];
}

class SignUpLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class SignUpSuccess extends AuthState {
  @override
  List<Object> get props => [];
}

class SignUpFail extends AuthState {
  final dynamic errorMsg;

  SignUpFail({this.errorMsg});
  @override
  List<Object> get props => [];
}

class LogoutSuccess extends AuthState {
  @override
  List<Object> get props => [];
}

class LogoutFail extends AuthState {
  final dynamic errorMsg;

  LogoutFail({this.errorMsg});
  @override
  List<Object> get props => [];
}

class LogoutLoading extends AuthState {
  @override
  List<Object> get props => [];
}
