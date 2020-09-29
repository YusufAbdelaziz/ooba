part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final int duration;
  TimerState(this.duration);
}

class Ready extends TimerState {
  Ready(int duration) : super(duration);

  @override
  String toString() => 'Ready';

  @override
  List<Object> get props => [];
}

class Paused extends TimerState {
  Paused(int duration) : super(duration);
  @override
  String toString() => 'Paused { duration: $duration }';

  @override
  List<Object> get props => [];
}

class Running extends TimerState {
  Running(int duration) : super(duration);

  @override
  String toString() => 'Running { duration: $duration }';

  @override
  List<Object> get props => [];
}

class Finished extends TimerState {
  Finished() : super(0);

  @override
  String toString() => 'Finished';

  @override
  List<Object> get props => [];
}
