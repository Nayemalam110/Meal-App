import 'package:flutter/material.dart';
import 'package:meal_app/meal_details_sreen.dart';
import '../model/meal.dart';
import './dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  String id;
  String name;

  String affordabilityText(af) {
    switch (af) {
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Pricey:
        return 'Pricey';

      case Affordability.Luxurious:
        return 'Expensive';

      default:
        return 'Unknown';
    }
  }

  String complexitytext(ct) {
    switch (ct) {
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Unknown';
    }
  }

  CategoryMealScreen({
    required this.id,
    required this.name,
  });

  List<Meal> get categoryMeal {
    return DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
  }

  void detilsPage(context, id) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MealDetailsPage(id);
    }));
  }

  @override
  Widget build(BuildContext context) {
    // final categoryMeal = DUMMY_MEALS.where((element) {
    //   return element.categories.contains(id);
    // }).toList();

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
          var catin = categoryMeal[index];
          return InkWell(
            onTap: () => detilsPage(context, catin.id),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 6,
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                         child: Image.network(catin.imageUrl),
                      ),
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          color: Colors.black38,
                          child: Text(
                            catin.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OoohBaby'),
                          ),
                        ),
                        bottom: 20,
                        right: 10,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule, size: 15),
                            Padding(padding: EdgeInsets.all(2)),
                            Text("${catin.duration} min")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work, size: 15),
                            Padding(padding: EdgeInsets.all(2)),
                            Text(complexitytext(catin.complexity))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money, size: 15),
                            Padding(padding: EdgeInsets.all(2)),
                            Text(affordabilityText(catin.affordability)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
