// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_todo_app/common/db/boxes.dart';
import 'package:responsive_todo_app/models/task.dart';

class UserTasks {
  final List<Task> tasks;

  UserTasks({
    required this.tasks,
  });

  UserTasks copyWith({
    List<Task>? tasks,
  }) {
    return UserTasks(
      tasks: tasks ?? this.tasks,
    );
  }
}

final taskProvider = StateNotifierProvider<TaskNotifier, UserTasks>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<UserTasks> {
  TaskNotifier() : super(UserTasks(tasks: [])) {
    state = state.copyWith(tasks: taskBox.values.toList());
  }

  void addTask(Task task) {
    try {
      if (task.title.isNotEmpty) {
        taskBox.add(task);
        state = state.copyWith(tasks: taskBox.values.toList());
      }
    } catch (e) {
      throw 'An unexpected error occurred';
    }
  }

  void removeTask(int index) {
    try {
      taskBox.deleteAt(index);
      state = state.copyWith(
        tasks: taskBox.values.toList(),
      );
    } catch (e) {
      throw 'An unexpected error occured';
    }
  }

  void clearCompletedTasks() {
    try {
      final List<Task> tasksToRemove =
          List.from(state.tasks.where((task) => task.isCompleted));

      for (int i = tasksToRemove.length - 1; i >= 0; i--) {
        final completedTask = tasksToRemove[i];
        final index = state.tasks.indexOf(completedTask);

        // print('Deleting task at index $index');

        try {
          taskBox.deleteAt(index);
        } catch (e) {
          // print('Error deleting task at index $index: $e');
        }
      }
      // Remove completed tasks from state.tasks after deleting them from taskBox
      state = state.copyWith(
        tasks: state.tasks.where((task) => !task.isCompleted).toList(),
      );
    } catch (e) {
      throw 'An unexpected error occurred';
    }
  }

  void toggleCompleted(int index, Task task) {
    try {
      task.isCompleted = !task.isCompleted;
      taskBox.putAt(index, task);
      state = state.copyWith(
        tasks: taskBox.values.toList(),
      );
    } catch (e) {
      throw 'An unexpected error occured';
    }
  }

  void reorderTasks(int oldIndex, int newIndex) {
    final List<Task> newTasks = List.from(state.tasks);
    final Task movedTask = newTasks.removeAt(oldIndex);
    newTasks.insert(newIndex, movedTask);

    //* Update the state with the new order of tasks
    state = state.copyWith(tasks: newTasks);

    //* update the taskBox
    taskBox.clear();
    for (int i = 0; i < newTasks.length; i++) {
      taskBox.put(i, newTasks[i]);
    }
  }
}
