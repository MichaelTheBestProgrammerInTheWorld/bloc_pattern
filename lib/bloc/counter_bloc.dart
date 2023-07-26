import 'package:bloc_pattern/bloc/counter_events.dart';
import 'package:bloc_pattern/bloc/counter_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  int counter = 0;

  //CounterBloc() : super(super.initialState) {}

  CounterBloc(super.initialState);

  static CounterBloc get(BuildContext context) => BlocProvider.of(context);

  @override
  CounterStates get initialState => InitialCounterState();

  @override
  Stream<CounterStates> mapEventToState(CounterEvents event) async* {
    if (event is IncrementCounterValue) {
      yield* _incrementValue('increment');
    }
    if (event is DecrementCounterValue) {
      yield* _decrementValue('decrement');
    }
  }

  Stream<CounterStates> _incrementValue(String s) async* {
    counter++;
    yield SuccessCounterState(s, counter);
  }

  Stream<CounterStates> _decrementValue(String s) async* {
    if (counter > 0) {
      counter--;
    }
    yield SuccessCounterState(s, counter);
  }
}
