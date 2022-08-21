import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import './category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;

  final String title;
  final Color color;

  void selectCategory(ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CategoryMealScreen(id: id, name: title);
    }));
  }

  CategoryItem(this.id, this.title, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(.3),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
