import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;

  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
