// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:counter_repository/counter_repository.dart';

class CounterState {
  final Counter counter;
  const CounterState({
    required this.counter,
  });

  CounterState.empty() : counter = Counter(initialValue: 0);

  CounterState copyWith({
    Counter? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
