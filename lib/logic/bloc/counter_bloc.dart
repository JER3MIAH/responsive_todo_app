import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_dart_practice/logic/bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  CounterBloc() : super(0) {
    on<CounterIncrementEvent>(_counterIncrement);

    on<CounterDecrementEvent>(_counterDecrement);
  }

  FutureOr<void> _counterIncrement(
      CounterIncrementEvent event, Emitter<int> emit) {
    emit(state + 1);
  }

  FutureOr<void> _counterDecrement(
      CounterDecrementEvent event, Emitter<int> emit) {
    emit(state - 1);
  }
}
