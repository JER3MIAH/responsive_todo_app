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
  double height = 100;
  double width = 100;

  onIncrement() {
    context.read<CounterBloc>().add(CounterIncrementEvent());
  }

  onDecrement() {
    context.read<CounterBloc>().add(CounterDecrementEvent());
  }

  opacityFunc() {
    setState(() {
      opacity = opacity == 0 ? 1 : 0;
    });
  }

  animatedContainerFunc() {
    setState(() {
      width = width == 100 ? 50 : 100;
      height = height == 100 ? 50 : 100;
    });
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
                Row(
                  children: [
                    TextButton(
                        onPressed: opacityFunc, child: const Text('Animate')),
                    TextButton(
                        onPressed: opacityFunc, child: const Text('Animate')),
                    TextButton(
                        onPressed: opacityFunc, child: const Text('Animate')),
                    TextButton(
                        onPressed: animatedContainerFunc,
                        child: const Text('tap me')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: opacity,
                      duration: const Duration(seconds: 2),
                      child: GestureDetector(
                        onTap: onIncrement,
                        child: Container(
                          color: Colors.red,
                          height: 100,
                          width: 100,
                          child: const Center(
                            child: Text(
                              'Add',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: onIncrement,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 3),
                        height: height,
                        width: width,
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            'Subtract',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
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
