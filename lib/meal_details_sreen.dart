import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'dummy_data.dart';

class MealDetailsPage extends StatelessWidget {
  final String mid;

  MealDetailsPage(this.mid);

  // get detailsList {
  //   return DUMMY_MEALS.firstWhere((element) => element.id == mid);
  // }

  @override
  Widget build(BuildContext context) {
    final detailsList = DUMMY_MEALS.firstWhere((element) => element.id == mid);

    return Scaffold(
      appBar: AppBar(
        title: Text(detailsList.title),
      ),
      body: Column(
        children: [
          Image.network(detailsList.imageUrl),
          Text('ingredients'),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: detailsList.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Text(detailsList.ingredients[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
