import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_dart_practice/logic/bloc/counter_bloc.dart';
import 'package:flutter_x_dart_practice/logic/bloc/counter_event.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  onIncrement() {
    context.read<CounterBloc>().add(CounterIncrementEvent());
  }

  onDecrement() {
    context.read<CounterBloc>().add(CounterDecrementEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$state', style: const TextStyle(fontSize: 30)),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.large(
                      onPressed: onIncrement,
                      child: const Text("Add"),
                    ),
                    FloatingActionButton.large(
                        onPressed: onDecrement, child: const Text('Subtract')),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
