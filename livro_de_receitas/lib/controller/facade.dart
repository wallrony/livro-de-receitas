import 'package:livrodereceitas/api/recipe_api.dart';
import 'package:livrodereceitas/models/recipe.dart';

class Facade {
  RecipeApi _recipeApi;

  /// Declaring a static instance of Facade
  static final Facade _facade = Facade._internal();

  /// Declaring a factory that returns the static instance of Facade.
  factory Facade() => _facade;

  Facade._internal() {
    _recipeApi = RecipeApi();
  }

  /// A function to select all recipes in database.
  indexRecipes() async => await _recipeApi.indexRecipes();

  /// A function to add a recipe in database.
  addRecipe(Recipe recipe) async => await _recipeApi.addRecipe(recipe);

  /// A function to edit a recipe in database.
  editRecipe(Recipe recipe) async => await _recipeApi.editRecipe(recipe);

  /// A function to delete a specific recipe in database.
  deleteRecipe(int id) async => await _recipeApi.deleteRecipe(id);
}