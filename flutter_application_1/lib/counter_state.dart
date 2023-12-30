abstract class CounterState {
  final int number;

  CounterState({required this.number});
}

class CounterInitial extends CounterState {
  CounterInitial({required super.number});
}

class CounterIncrement extends CounterState {
  CounterIncrement({required super.number});
}

class CounterDecrement extends CounterState {
  CounterDecrement({required super.number});
}
