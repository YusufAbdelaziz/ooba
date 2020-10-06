part of 'state_handler_cubit.dart';

abstract class StateHandlerState extends Equatable {
  final bool value;
   StateHandlerState(this.value);
}

class StateHandlerInitial extends StateHandlerState {
  StateHandlerInitial(bool value) : super(value);

  @override
  List<Object> get props => [];
}

class StateSwitched extends StateHandlerState {
  final bool value;

  StateSwitched({@required this.value}) : super(value);
  @override
  List<Object> get props => [];
}
