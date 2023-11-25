import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_dart_practice/apps/dummy_folder/bloc/counter_bloc.dart';
import 'package:flutter_x_dart_practice/apps/dummy_folder/bloc/counter_event.dart';
import 'package:flutter_x_dart_practice/apps/dummy_folder/bloc/counter_state.dart';

class BlocPractice extends StatefulWidget {
  const BlocPractice({super.key});

  @override
  State<BlocPractice> createState() => _BlocPracticeState();
}

class _BlocPracticeState extends State<BlocPractice> {
  _increment() {
    context.read<CounterBloc>().add(IncrementCounterEvent());
  }

  _decrement() {
    context.read<CounterBloc>().add(DecrementCounterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            backgroundColor: Colors.deepPurple,
            snap: true,
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Bloc Counter App'),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (ctx, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${state.count}'),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: _increment, child: const Text('add')),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: _decrement, child: const Text('sub')),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
