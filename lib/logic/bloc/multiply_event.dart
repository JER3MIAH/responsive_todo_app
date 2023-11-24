import 'package:equatable/equatable.dart';

abstract class MultiplyEvent extends Equatable {
  const MultiplyEvent();

  @override
  List<Object> get props => [];
}

class MultiplyNumberEvent extends MultiplyEvent {
  @override
  List<Object> get props => [];
}
