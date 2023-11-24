import 'dart:async';
import 'package:counter_repository/counter_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_dart_practice/logic/bloc/counter_event.dart';
import 'package:flutter_x_dart_practice/logic/bloc/multiply_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, Counter> {
  final MultiplyBloc multplyBloc;
  late StreamSubscription<int> multiplyStreamSubscription;
  @override
  CounterBloc({required this.multplyBloc}) : super(Counter.empty()) {
    multiplyStreamSubscription = multplyBloc.stream.listen(
      (multiplyState) {
        if (multiplyState == 10) {
          
        }
      },
    );
    on<CounterIncrementEvent>(_counterIncrement);

    on<CounterDecrementEvent>(_counterDecrement);
  }

  FutureOr<void> _counterIncrement(
      CounterIncrementEvent event, Emitter<Counter> emit) {
    emit(state.copyWith(initialValue: state.initialValue + 1));
  }

  _counterDecrement(CounterDecrementEvent event, Emitter<Counter> emit) {
    emit(state.copyWith(initialValue: state.initialValue - 1));
  }
}
