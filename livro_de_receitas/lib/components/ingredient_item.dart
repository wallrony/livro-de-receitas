import 'package:flutter/material.dart';
import 'package:livrodereceitas/components/custom_text.dart';
import 'package:livrodereceitas/models/ingredient.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  IngredientItem({this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: ,
      children: [
        Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        SizedBox(width: 5),
        CustomText(
          text: "${ingredient.name} - ${ingredient.quantity}",
          fontSize: 12,
        ),
      ],
    );
  }
}
