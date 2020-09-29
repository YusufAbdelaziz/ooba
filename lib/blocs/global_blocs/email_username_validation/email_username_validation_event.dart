part of 'email_username_validation_bloc.dart';

abstract class EmailUsernameValidationEvent extends Equatable {
  const EmailUsernameValidationEvent();
}

class EmailChecked extends EmailUsernameValidationEvent {
  final String email;

  EmailChecked({@required this.email});

  @override
  List<Object> get props => throw [this.email];
}

class UsernameChecked extends EmailUsernameValidationEvent {
  final String username;

  UsernameChecked({@required this.username});

  @override
  List<Object> get props => throw [this.username];
}

class UsernameEmailChecked extends EmailUsernameValidationEvent {
  final String usernameEmail;

  UsernameEmailChecked({@required this.usernameEmail});

  @override
  List<Object> get props => throw [this.usernameEmail];
}
