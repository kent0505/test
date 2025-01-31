import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  late Timer _timer;

  TimerBloc() : super(TimerInitial()) {
    on<StartTimer>((event, emit) async {
      int second = event.seconds;

      _timer.cancel();
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (second > 0) {
          second--;
          emit(TimerStarted(second: second));
        } else {
          timer.cancel();
          emit(TimerStopped());
        }
      });
    });

    on<StopTimer>((event, emit) {
      _timer.cancel();
    });
  }
}
