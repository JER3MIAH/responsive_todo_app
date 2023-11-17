class CounterState {
  final int counter;
  const CounterState({
    required this.counter,
  });

  const CounterState.empty() : counter = 0;

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}