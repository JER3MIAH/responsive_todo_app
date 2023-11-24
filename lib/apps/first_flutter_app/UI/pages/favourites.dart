import 'package:flutter/material.dart';
import 'package:flutter_x_dart_practice/apps/first_flutter_app/providers/appstate.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet'),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 400 / 80,
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
            children: [
              for (var fav in appState.favorites)
                ListTile(
                  title: Text(
                    fav.asLowerCase,
                    semanticsLabel: fav.asPascalCase,
                  ),
                  leading: IconButton(
                    onPressed: () {
                      appState.removeFavorite(fav);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
