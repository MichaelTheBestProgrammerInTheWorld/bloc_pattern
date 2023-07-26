import 'package:flutter/cupertino.dart';

@immutable
abstract class CounterStates {
  const CounterStates();
}

class InitialCounterState extends CounterStates {}

class SuccessCounterState extends CounterStates {
  String type;
  int count;

  SuccessCounterState(this.type, this.count);
}

class ErrorCounterState extends CounterStates {
  String error;

  ErrorCounterState(this.error);
}
