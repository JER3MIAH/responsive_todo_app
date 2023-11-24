import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_dart_practice/logic/bloc/multiply_event.dart';

class MultiplyBloc extends Bloc<MultiplyEvent, int> {
  MultiplyBloc() : super(0) {
    on<MultiplyNumberEvent>((event, emit) {
      emit(state + 1 * 10);
    });
  }
}
