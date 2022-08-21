import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/model/meal.dart';
import './category_screen.dart';

void main() {
  runApp(MyMeal());
}

class MyMeal extends StatelessWidget {
  const MyMeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      themeMode: ThemeMode.light,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.purple,
      ).copyWith(secondary: Colors.amber)),
      home: CategoryScreen(),
    );
  }
}
