import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var bodyLarge = Theme.of(context).textTheme.bodyLarge;
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(border: Border.all()),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 70,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Text('Flutter McFlutter',
                          style: Theme.of(context).textTheme.headlineMedium),
                      Text('Experienced App Developer', style: bodyLarge),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('123 Main Street', style: bodyLarge),
                  Text('(415) 555-0198', style: bodyLarge),
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.accessibility),
                  Icon(Icons.timer),
                  Icon(Icons.phone_android),
                  Icon(Icons.phone_iphone),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
