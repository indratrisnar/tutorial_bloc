import 'package:flutter_application_1/counter_event.dart';
import 'package:flutter_application_1/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(number: 0)) {
    on<OnCounterIncrement>((event, emit) {
      emit(CounterIncrement(number: state.number + 1));
    });
    on<OnCounterDecrement>((event, emit) {
      if (state.number > 0) emit(CounterDecrement(number: state.number - 1));
    });
  }
}
