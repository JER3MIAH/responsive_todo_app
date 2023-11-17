import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_dart_practice/logic/bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  CounterBloc() : super(0) {
    on<CounterIncrementEvent>((event, emit) {
      emit(
        state + 1,
      );
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(
        state - 1,
      );
    });
  }
}
