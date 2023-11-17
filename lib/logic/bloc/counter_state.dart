
import 'package:equatable/equatable.dart';

sealed class CounterState extends Equatable {
  const CounterState();
  
  @override
  List<Object?> get props => [];
}

final class CounterInitial extends CounterState {}
