// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;
  const CounterState({required this.count});

  @override
  List<Object?> get props => [count];

  CounterState copyWith({
    int? count,
  }) {
    return CounterState(
      count: count ?? this.count,
    );
  }
}
