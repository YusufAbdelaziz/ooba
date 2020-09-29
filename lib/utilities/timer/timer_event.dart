part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
}

class Start extends TimerEvent {


  @override
  String toString() => "Start";

  @override
  List<Object> get props => [];
}

class End extends TimerEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'End';
}

class Reset extends TimerEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'Reset';
}

class Pause extends TimerEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'Pause';
}

class Resume extends TimerEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'Resume';
}

class Tick extends TimerEvent {
  final int duration;

  Tick({@required this.duration});

  @override
  String toString() => "Tick { duration: $duration }";

  @override
  List<Object> get props => [duration];
}
