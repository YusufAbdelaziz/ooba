import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final int _duration;
  final Ticker _ticker;
  StreamSubscription<int> _tickerSubscription;
  TimerBloc({@required Ticker ticker, @required int duration})
      : _ticker = ticker,
        _duration = duration,
        super(Ready(duration));



  @override
  Stream<TimerState> mapEventToState(
    TimerEvent event,
  ) async* {
    if (event is Start) {
      yield* _mapStartToState(event);
    } else if (event is Tick) {
      yield* _mapTickToState(event);
    } else if (event is Reset) {
      yield* _mapRestToState(event);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Stream<TimerState> _mapStartToState(Start start) async* {
    yield Running(_duration);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: _duration).listen((duration) {
      add(Tick(duration: duration));
    });
  }

  Stream<TimerState> _mapTickToState(Tick tick) async* {
    yield Ready(0);
    yield tick.duration > 0 ? Running(tick.duration) : Finished();
  }

  Stream<TimerState> _mapRestToState(Reset reset) async* {
    _tickerSubscription?.cancel();
    add(Start());
  }
}
