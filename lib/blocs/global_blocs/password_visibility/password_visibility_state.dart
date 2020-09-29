part of 'password_visibility_cubit.dart';

abstract class PasswordVisibilityState extends Equatable {
  const PasswordVisibilityState();
}

class PasswordVisibilityInitial extends PasswordVisibilityState {
  @override
  List<Object> get props => [];
}

class SwitchPasswordVisibility extends PasswordVisibilityState {
  final bool isVisible;

  SwitchPasswordVisibility({@required this.isVisible});
  @override
  List<Object> get props => [];
}

class SwitchConfirmPasswordVisibility extends PasswordVisibilityState {
  final bool isVisible;

  SwitchConfirmPasswordVisibility({@required this.isVisible});
  @override
  List<Object> get props => [];
}
