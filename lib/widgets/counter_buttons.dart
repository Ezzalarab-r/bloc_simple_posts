import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_bloc.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: '1',
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterIncrement());
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          heroTag: '2',
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterReset());
          },
          child: const Icon(Icons.exposure_zero),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          heroTag: '3',
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterDecrement());
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
