import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      elevation: 0.0,
      labelBehavior: labelBehavior,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home_max),
          label: 'Inicio',
        ),
        NavigationDestination(
          icon: Icon(Icons.label_outline),
          label: 'Categorias',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
