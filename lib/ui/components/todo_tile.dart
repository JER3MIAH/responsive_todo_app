import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_todo_app/ui/components/components.dart';
import 'package:responsive_todo_app/ui/theme/colors.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final bool isFirst;
  final void Function(bool?)? onChanged;
  final void Function()? onDelete;
  const TodoTile({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.isFirst,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: theme.primary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(isFirst ? 5 : 0),
        ),
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade500.withOpacity(0.4)),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: GoogleFonts.josefinSans(color: theme.secondary),
        ),
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Checkbox(
              onChanged: onChanged,
              value: isCompleted,
              checkColor: Colors.transparent,
              shape: const CircleBorder(),
              hoverColor: checkboxGradient[0],
              side: BorderSide(
                color: theme.tertiary,
                style: BorderStyle.solid,
                width: 2,
              ),
              fillColor: isCompleted
                  ? MaterialStatePropertyAll(checkboxGradient[1])
                  : null,
            ),
            isCompleted
                ? SvgPicture.asset(
                    'assets/images/icon-check.svg',
                  )
                : const SizedBox.shrink(),
          ],
        ),
        trailing: DeleteButton(
          onTap: onDelete,
        ),
      ),
    );
  }
}
