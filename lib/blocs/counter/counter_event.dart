part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
  const CounterEvent();
}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}
