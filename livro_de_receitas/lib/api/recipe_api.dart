import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:livrodereceitas/api/base_api.dart';
import 'package:livrodereceitas/models/recipe.dart';

class RecipeApi extends BaseApi {
  indexRecipes() async {
    var recipes;

    try {
      final response = await http.get('$apiUrl/recipes');

      print(response.body);

      var recipeObjList = responseToMap(response).map(
        (object) => Map<String, dynamic>.from(object),
      ).toList();

      recipes = List<Recipe>();

      print(recipeObjList);

      for (final recipeObj in recipeObjList) {
        recipes.add(Recipe.fromJson(recipeObj));
      }
    } catch (error) {
      print("Error: $error");
      recipes =
          'Aconteceu algum erro... Por favor, tente novamente mais tarde.';
    }

    return recipes;
  }

  addRecipe(Recipe recipe) async {
    final body = json.encode(recipe.toMap());
    var result;

    try {
      final response = await http.post('$apiUrl/recipes', body: body);

      Map<String, dynamic> mapResponse = responseToMap(response);

      if (mapResponse['message'] == 'success - data added')
        result = true;
      else
        result = mapResponse['message'];
    } catch (error) {
      print(error);
      result = 'Aconteceu algum erro... Por favor, tente novamente mais tarde.';
    }

    return result;
  }

  editRecipe(Recipe recipe) async {
    final body = json.encode(recipe.toMap());
    var result;

    try {
      final response = await http.put(
        '$apiUrl/recipes/${recipe.id}',
        body: body,
      );

      Map<String, dynamic> mapResponse = responseToMap(response);

      if (mapResponse['message'] == 'success - data updated')
        result = true;
      else
        result = mapResponse['message'];
    } catch (error) {
      result = 'Aconteceu algum erro... Por favor, tente novamente mais tarde.';
    }

    return result;
  }

  deleteRecipe(int id) async {
    var result;

    try {
      final response = await http.delete('$apiUrl/recipes/$id');

      Map<String, dynamic> mapResponse = responseToMap(response);

      if (mapResponse['message'] == 'success - data deleted')
        result = true;
      else
        result = mapResponse['message'];
    } catch (error) {
      result = 'Aconteceu algum erro... Por favor, tente novamente mais tarde.';
    }

    return result;
  }
}
