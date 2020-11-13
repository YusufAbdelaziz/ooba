part of 'password_validation_bloc.dart';

abstract class PasswordValidationState extends Equatable {
  const PasswordValidationState();
}

class PasswordValidationInitial extends PasswordValidationState {
  @override
  List<Object> get props => [];
}

class SignUpPasswordsValid extends PasswordValidationState {
  @override
  List<Object> get props => [];
}

class SignUpPasswordsInvalid extends PasswordValidationState {
  @override
  List<Object> get props => [];
}

class SignUpPasswordsNotEqual extends PasswordValidationState {
  @override
  List<Object> get props => [];
}

class SignInPasswordValid extends PasswordValidationState {
  @override
  List<Object> get props => [];
}

class SignInPasswordInvalid extends PasswordValidationState {

  @override
  List<Object> get props => [];
}
