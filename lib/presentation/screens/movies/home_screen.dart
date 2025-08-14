import 'package:flutter/material.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import '../../views/views.dart';

class HomeScreen extends StatelessWidget {
  static var name = 'home-screen';
  final int pageIndex;

  HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = <Widget>[HomeView(), SizedBox(), FavoriteView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: pageIndex, children: viewRoutes),
      bottomNavigationBar: CustomButtomNavigaton(currentIndex: pageIndex),
    );
  }
}
