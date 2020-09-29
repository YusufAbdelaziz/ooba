part of 'email_username_validation_bloc.dart';

abstract class EmailUsernameValidationState extends Equatable {
  const EmailUsernameValidationState();
}

class EmailValidationInitial extends EmailUsernameValidationState {
  @override
  List<Object> get props => [];
}

class EmailInvalid extends EmailUsernameValidationState {
  @override
  List<Object> get props => [];
}

class EmailValid extends EmailUsernameValidationState {
  @override
  List<Object> get props => [];
}

class UsernameValid extends EmailUsernameValidationState {
  @override
  List<Object> get props => [];
}

class UsernameInvalid extends EmailUsernameValidationState {
  @override
  List<Object> get props => [];
}
class UsernameEmailValid extends EmailUsernameValidationState {
  @override
  List<Object> get props => [];
}

class UsernameEmailInvalid extends EmailUsernameValidationState {
  @override
  List<Object> get props => [];
}