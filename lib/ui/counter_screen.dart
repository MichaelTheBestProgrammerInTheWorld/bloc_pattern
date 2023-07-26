import 'package:bloc_pattern/bloc/counter_bloc.dart';
import 'package:bloc_pattern/bloc/counter_events.dart';
import 'package:bloc_pattern/bloc/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    // c is screen context will never be used
    return BlocProvider<CounterBloc>(
      create: (BuildContext context) => CounterBloc(InitialCounterState()),
      child: BlocConsumer<CounterBloc, CounterStates>(
        listener: (BuildContext context, CounterStates state) {
          if (state is SuccessCounterState) {
            print(
                'counter bloc state : success, type : ${state.type} , counter : ${state.count}');
          }
        },
        builder: (BuildContext context, CounterStates state) {
          int counter = CounterBloc.get(context).counter;
          return Scaffold(
            appBar: AppBar(
              title: Text('BloC Pattern Demo'),
              backgroundColor: Colors.cyanAccent,
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      CounterBloc.get(context).add(IncrementCounterValue());
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    counter.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      CounterBloc.get(context).add(DecrementCounterValue());
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
