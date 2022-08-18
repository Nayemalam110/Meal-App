import 'package:flutter/material.dart';
import '../model/meal.dart';
import './dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  String id;
  String name;

  CategoryMealScreen(this.id, this.name);

  List<Meal> get categoryMeal {
    return DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // final categoryMeal = DUMMY_MEALS.where((element) {
    //   return element.categories.contains(id);
    // }).toList();
    print(categoryMeal.map((e) {
      return {e.id, e.title};
    }).toList());

// final categotyMeals = DUMMY_MEALS.where((meals) {
//     return  meals.categories.contains(id);
//   }).toList;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView.builder(
        itemCount: categoryMeal.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 6,
            margin: EdgeInsets.all(15),
            child: ListTile(
              title: Text(categoryMeal[index].title),
            ),
          );
        },
      ),
    );
  }
}
