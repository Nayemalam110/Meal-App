import 'package:flutter/material.dart';
import 'package:meal_app/category_screen.dart';
import 'package:meal_app/favorite.dart';
import 'package:meal_app/model/meal.dart';
import 'meal_details_sreen.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pages = [
    CategoryScreen(),
    Favorite(),
  ];

  int currentIndex = 0;

  void _selectPageIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorites'),
        ],
        currentIndex: currentIndex,
      ),
    );
  }
}
