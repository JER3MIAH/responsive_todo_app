import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_todo_app/ui/pages/pages.dart';
import 'common/db/boxes.dart';
import 'models/task.dart';
import 'providers/theme_provider.dart';
import 'ui/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter()); // Register the adapter
  taskBox = await Hive.openBox<Task>('taskBox'); // Open the Hive box

  runApp(
    const ProviderScope(
      child: TodoApp(),
    ),
  );
}

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A simple todo app',
      theme: isDarkMode ? darkTheme : lightTheme,
      home: const HomePage(
        mobilePage: MobilePage(),
        webPage: WebPage(),
      ),
    );
  }
}
