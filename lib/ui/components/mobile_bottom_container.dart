import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_todo_app/ui/theme/colors.dart';

class MobileBottomContainer extends HookWidget {
  final int notCompleted;
  final void Function() onTap;

  const MobileBottomContainer({
    super.key,
    required this.notCompleted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = useState<bool>(false);

    final theme = Theme.of(context).colorScheme;
    final textStyle = GoogleFonts.josefinSans(
      color: theme.tertiary,
    );
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(5),
        ),
        border: const Border(top: BorderSide(color: Colors.white24)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$notCompleted items left',
              style: textStyle,
            ),
            MouseRegion(
              onEnter: (event) {
                isHovered.value = true;
              },
              onExit: (event) {
                isHovered.value = false;
              },
              child: TextButton(
                onPressed: onTap,
                child: Text(
                  'Clear completed',
                  style: GoogleFonts.josefinSans(
                    color:
                        isHovered.value ? checkboxGradient[0] : theme.tertiary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
