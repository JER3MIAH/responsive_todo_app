import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_dart_practice/logic/bloc/counter_event.dart';
import 'package:flutter_x_dart_practice/logic/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState.empty()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(
        state.copyWith(counter: state.counter + 1),
      );
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(
        state.copyWith(counter: state.counter - 1),
      );
    });
  }
}
