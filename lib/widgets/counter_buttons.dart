import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterIncrement());
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterReset());
          },
          child: const Icon(Icons.exposure_zero),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterDecrement());
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}

class BLocProvider {}
