import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_dart_practice/logic/bloc/counter_bloc.dart';
import 'package:flutter_x_dart_practice/logic/bloc/counter_state.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('data', style: TextStyle(fontSize: 30)),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.large(
                      onPressed: () {},
                      child: const Text("Add"),
                    ),
                    FloatingActionButton.large(
                        onPressed: () {}, child: const Text('Subtract')),
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
