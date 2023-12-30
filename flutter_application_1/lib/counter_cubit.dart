import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  increment() => emit(state + 1);

  decrement() {
    if (state > 0) emit(state - 1);
  }
}
