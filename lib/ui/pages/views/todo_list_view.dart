import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_todo_app/models/selected.dart';
import 'package:responsive_todo_app/models/task.dart';
import 'package:responsive_todo_app/providers/selected_string_provider.dart';
import 'package:responsive_todo_app/providers/task_provider.dart';
import 'package:responsive_todo_app/ui/components/components.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final selectedString = ref.watch(selectedStringProvider);
    final todos = ref.watch(taskProvider).tasks;
    final completed = todos.where((todo) => todo.isCompleted).toList();
    final active = todos.where((todo) => !todo.isCompleted).toList();

    List<Task> selectedFilter() {
      if (selectedString == IsSelected.all) {
        return todos;
      } else if (selectedString == IsSelected.completed) {
        return completed;
      } else {
        return active;
      }
    }

    return Container(
      height: MediaQuery.of(context).size.height * .5,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(5))),
      child: ListView.builder(
        itemCount: selectedFilter().length,
        itemBuilder: (context, index) {
          final todo = selectedFilter()[index];
          return TodoTile(
            key: ValueKey(index),
            isFirst: index == 0,
            title: todo.title,
            isCompleted: todo.isCompleted,
            onChanged: (isChecked) {
              ref.read(taskProvider.notifier).toggleCompleted(index, todo);
            },
            onDelete: () {
              ref.read(taskProvider.notifier).removeTask(index);
            },
          );
        },
      ),
    );
  }
}
