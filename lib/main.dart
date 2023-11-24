import 'package:flutter/material.dart';
import 'package:flutter_x_dart_practice/apps/first_flutter_app/UI/pages/home_view.dart';
import 'package:provider/provider.dart';

import 'apps/first_flutter_app/providers/appstate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage()),
    );
  }
}
