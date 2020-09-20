part of 'state_handler_cubit.dart';

abstract class StateHandlerState extends Equatable {
  const StateHandlerState();
}

class StateHandlerInitial extends StateHandlerState {
  @override
  List<Object> get props => [];
}

class StateSwitched extends StateHandlerState {
  final bool value;

  StateSwitched({@required this.value});
  @override
  List<Object> get props => [];
}
