import 'package:flutter/material.dart';
import 'package:livrodereceitas/components/custom_text.dart';
import 'package:livrodereceitas/components/ingredient_item.dart';
import 'package:livrodereceitas/models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  RecipeItem({this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.amber[500],
            blurRadius: 5,
            offset: Offset(3, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: recipe.name,
                  isBold: true,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
                CustomText(
                  text: "Duração: ${recipe.time}",
                  isBold: false,
                ),
                SizedBox(height: 8),
                ...recipe.ingredients.map(
                  (ingredient) => Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.only(left: 6),
                    child: IngredientItem(ingredient: ingredient),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
