import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_todo_app/models/selected.dart';

final selectedStringProvider =
    StateNotifierProvider<SelectedStringNotifier, IsSelected>((ref) {
  return SelectedStringNotifier();
});

class SelectedStringNotifier extends StateNotifier<IsSelected> {
  SelectedStringNotifier() : super(IsSelected.all);

  void selectString(String selectedString) {
    if (selectedString == 'All') {
      state = IsSelected.all;
    } else if (selectedString == 'Completed') {
      state = IsSelected.completed;
    } else {
      state = IsSelected.incompleted;
    }
  }
}
