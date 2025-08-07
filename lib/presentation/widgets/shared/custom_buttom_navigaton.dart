import 'package:flutter/material.dart';

class CustomButtomNavigaton extends StatelessWidget {
  @override
  Widget build(Object context) {
    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
