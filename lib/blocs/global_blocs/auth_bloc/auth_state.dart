part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSignIn extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSignUp extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthForgetPassword extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthEmailCheck extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthPhoneVerification extends AuthState {
  @override
  List<Object> get props => [];
}
