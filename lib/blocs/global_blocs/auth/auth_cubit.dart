import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signInSwitched() {
    emit(AuthSignIn());
  }

  void signUpSwitched() {
    emit(AuthSignUp());
  }

  void forgetPasswordSwitched() {
    emit(AuthForgetPassword());
  }

  void checkEmailSwitched() {
    emit(AuthEmailCheck());
  }

  void phoneVerificationSwitched() {
    emit(AuthPhoneVerification());
  }
}
