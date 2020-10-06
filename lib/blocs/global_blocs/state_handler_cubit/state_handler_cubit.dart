import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'state_handler_state.dart';

class StateHandlerCubit extends Cubit<StateHandlerState> {
  StateHandlerCubit() : super(StateHandlerInitial(false));

  void valueSwitched({@required bool value}) {
    emit(StateHandlerInitial(value));
    emit(StateSwitched(value: value));
  }
}
