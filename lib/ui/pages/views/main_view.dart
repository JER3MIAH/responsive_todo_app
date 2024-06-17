import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_todo_app/models/task.dart';
import 'package:responsive_todo_app/providers/task_provider.dart';
import 'package:responsive_todo_app/providers/theme_provider.dart';
import 'package:responsive_todo_app/ui/components/components.dart';
import 'package:responsive_todo_app/ui/pages/views/todo_list_view.dart';
import 'package:responsive_todo_app/ui/theme/colors.dart';

class MainView extends HookConsumerWidget {
  final bool isMobile;
  const MainView({
    super.key,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context, ref) {
    // final theme = Theme.of(context).colorScheme;
    final isDarkMode = ref.watch(themeProvider);
    final textController = useTextEditingController();
    final itemsNotChecked = ref
        .watch(taskProvider)
        .tasks
        .where((todo) => !todo.isCompleted)
        .toList();

    return Center(
      child: Container(
        constraints: !isMobile ? const BoxConstraints(maxWidth: 600) : null,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TODO',
                    style: GoogleFonts.josefinSans(
                        fontSize: 28, color: veryLightGray.toColor())),
                GestureDetector(
                  onTap: () {
                    ref.read(themeProvider.notifier).toggleTheme();
                  },
                  child: SvgPicture.asset(
                      'assets/images/icon-${isDarkMode ? 'sun' : 'moon'}.svg'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TodoTextField(
              controller: textController,
              onSubmitted: (p0) {
                ref.read(taskProvider.notifier).addTask(
                      Task(title: textController.text.trim()),
                    );
                textController.clear();
              },
              onTap: () {
                ref.read(taskProvider.notifier).addTask(
                      Task(title: textController.text.trim()),
                    );
                textController.clear();
              },
            ),
            const SizedBox(height: 10),
            const TodoListView(),
            MobileBottomContainer(
              notCompleted: itemsNotChecked.length,
              onTap: () {
                ref.read(taskProvider.notifier).clearCompletedTasks();
              },
            ),
            const SizedBox(height: 20),
            MobileBottomContainer2(
              isMobile: isMobile,
            ),
          ],
        ),
      ),
    );
  }
}
