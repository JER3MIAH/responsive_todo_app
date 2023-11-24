import 'package:flutter/material.dart';
import 'package:flutter_x_dart_practice/apps/first_flutter_app/UI/pages/favourites.dart';
import 'generator_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //* ----------------------------------------
    Widget page;
    switch (_selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavouritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }
    var mainPage = Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: page,
        ),
      ),
    );
    //* ----------------------------------------
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 700) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      _selectedIndex = value;
                    });
                  },
                ),
              ),
              mainPage,
            ],
          ),
        );
      } else {
        return Scaffold(
          body: Column(
            children: [
              mainPage,
              SafeArea(
                child: BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favorites',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  onTap: (value) {
                    setState(() {
                      _selectedIndex = value;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
