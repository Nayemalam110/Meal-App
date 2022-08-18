import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal_app/category_item.dart';
import './model/category.dart';
import './dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView(
          padding: EdgeInsets.all(10),
          children: DUMMY_CATEGORIES.map((e) {
            return Card(
              elevation: 5,
              color: Colors.transparent,
              child: CategoryItem(e.id, e.title, e.color),
            );
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          )),
    );
  }
}
