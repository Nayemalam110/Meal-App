import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/model/meal.dart';
import 'meal_details_sreen.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: favList.map((e) {
        return Card(
          child: ListTile(
            leading: Text(e.title),
          ),
        );
      }).toList(),
    );
  }
}
