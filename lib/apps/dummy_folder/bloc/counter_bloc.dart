import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(count: 0)) {
    on<IncrementCounterEvent>(_increment);

    on<DecrementCounterEvent>(_decrement);
  }

  FutureOr _decrement(DecrementCounterEvent event, Emitter emit) {
    print('Decrement event received');
    emit(state.copyWith(count: state.count - 1));
  }

  FutureOr _increment(IncrementCounterEvent event, Emitter emit) {
    print('Increment event received');
    emit(state.copyWith(count: state.count + 1));
  }
}
