import 'package:responsive_todo_app/models/selected.dart';

class StringSelection {
  final IsSelected isSelected;
  final String selectedString;

  StringSelection({
    this.isSelected = IsSelected.all,
    this.selectedString = '',
  });

  StringSelection copyWith({
    IsSelected? isSelected,
    String? selectedString,
  }) {
    return StringSelection(
      isSelected: isSelected ?? this.isSelected,
      selectedString: selectedString ?? this.selectedString,
    );
  }
}
