import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  void authPagesSwitched() {
    emit(AuthPages());
  }

  void mainPagesSwitched() {
    emit(MainPages());
  }
}
