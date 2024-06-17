import 'package:flutter/material.dart';
import 'package:responsive_todo_app/ui/components/components.dart';
import 'package:responsive_todo_app/ui/pages/views/main_view.dart';

class WebPage extends StatelessWidget {
  const WebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                BackgroundImage(isMobile: false),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 10),
              child: MainView(isMobile: false),
            ),
          ],
        ),
      ),
    );
  }
}
