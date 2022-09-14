import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'dummy_data.dart';

List<Meal> favList = [];

class MealDetailsPage extends StatelessWidget {
  final String mid;

  MealDetailsPage(this.mid);

  // get detailsList {
  //   return DUMMY_MEALS.firstWhere((element) => element.id == mid);
  // }

  @override
  Widget build(BuildContext context) {
    final detailsList = DUMMY_MEALS.firstWhere((element) => element.id == mid);

    favlist(mid) {
      final exitingIndex = favList.indexWhere((element) => element.id == mid);

      if (exitingIndex >= 0) {
        favList.removeAt(exitingIndex);
      } else {
        favList.add(DUMMY_MEALS.firstWhere((element) => element.id == mid));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(detailsList.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Image.network(detailsList.imageUrl),
            Text('Ingredients'),
            Container(
              height: 150,
              width: 200,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: ListView.builder(
                itemCount: detailsList.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Text(detailsList.ingredients[index]),
                  );
                },
              ),
            ),
            Text('Steps'),
            Container(
              height: 150,
              width: 200,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: ListView.builder(
                itemCount: detailsList.steps.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Text(detailsList.steps[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => favlist(detailsList.id),
        child: Icon(Icons.favorite_border),
      ),
    );
  }
}
