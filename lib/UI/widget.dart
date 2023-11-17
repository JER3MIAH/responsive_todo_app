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
  double opacity = 0;
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
        child: BlocConsumer<CounterBloc, int>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$state', style: const TextStyle(fontSize: 30)),
                const SizedBox(height: 30),
                TextButton(
                    onPressed: () {
                      setState(() {
                        opacity = opacity == 0 ? 1 : 0;
                      });
                    },
                    child: const Text('Animate')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: opacity,
                      duration: const Duration(seconds: 2),
                      child: FloatingActionButton.large(
                        onPressed: onIncrement,
                        child: const Text("Add"),
                      ),
                    ),
                    FloatingActionButton.large(
                      onPressed: onDecrement,
                      child: const Text('Subtract'),
                    ),
                  ],
                ),
              ],
            );
          },
          listenWhen: (previous, current) {
            return current == 7;
          },
          listener: (context, state) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('5 baby!!')));
          },
        ),
      ),
    );
  }
}
