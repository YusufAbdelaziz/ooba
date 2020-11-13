import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repos/user_repo/user_repo.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  void checkUserValidity() async {
    final user = await UserRepo.fetchData();
    print(user);
    if (user.isRemembered && user.isAuthenticated) {
      emit(MainPages());
    } else {
      emit(AuthPages());
    }
  }
  void switchMainPages (){
    emit(MainPages());
  }

  void switchAuthPages (){
    emit(AuthPages());
  }
}
