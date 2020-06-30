import 'package:flutter/material.dart';
import 'package:livrodereceitas/models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  RecipeItem({this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
