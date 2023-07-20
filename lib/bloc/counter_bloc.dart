import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is CounterIncrement) {
        counter++;
        emit(CounterValueChanged(counter));
      } else if (event is CounterDecrement) {
        counter--;
        emit(CounterValueChanged(counter));
      } else {
        counter = 0;
        emit(CounterValueChanged(counter));
      }
    });
  }
}
