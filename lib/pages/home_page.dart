import 'package:bloc_simple_posts/app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/app_strings.dart';
import '../bloc/counter/counter_bloc.dart';
import '../widgets/counter_buttons.dart';
import 'settings_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.blocTest.tr(context)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
            icon: const Icon(Icons.settings_outlined),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value is:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                int counter = 0;
                if (state is CounterValueChanged) {
                  counter = state.counter;
                }
                return Text(
                  counter.toString(),
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: const CounterButtons(),
    );
  }
}
