part of 'password_validation_bloc.dart';

abstract class PasswordValidationEvent extends Equatable {
  const PasswordValidationEvent();
}

class SignUpPasswordsChecked extends PasswordValidationEvent {
  final String password;
  final String confirmPassword;

  SignUpPasswordsChecked({@required this.password, @required this.confirmPassword});

  @override
  List<Object> get props => [password, confirmPassword];
}

class SignInPasswordChecked extends PasswordValidationEvent {
  final String password;

  SignInPasswordChecked({
    @required this.password,
  });

  @override
  List<Object> get props => [password];
}
