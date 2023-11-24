import 'package:flutter/material.dart';
import 'package:flutter_x_dart_practice/providers/appstate.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favurites yet'),
      );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
      children: [
        Text(
          'Favourites',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        for (var fav in appState.favorites)
          ListTile(
            title: Text(fav.toString()),
          ),
      ],
    );
  }
}
