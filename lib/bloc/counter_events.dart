import 'package:flutter/cupertino.dart';

@immutable
abstract class CounterEvents {
  const CounterEvents();
}

class IncrementCounterValue extends CounterEvents {}

class DecrementCounterValue extends CounterEvents {}
