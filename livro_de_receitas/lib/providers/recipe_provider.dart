import 'package:livrodereceitas/utils/connectity_utils.dart';
import 'package:livrodereceitas/controller/facade.dart';
import 'package:livrodereceitas/models/recipe.dart';
import 'package:livrodereceitas/providers/base_provider.dart';

class RecipeProvider extends BaseProvider {
  List<Recipe> _recipes;
  List<Recipe> get recipes => _recipes;

  Future<void> fetchRecipes() async {
    if(!(await isOnline()))
      return 'offline';

    setRunning(true);

    try {
      final recipes = await Facade().indexRecipes();

      print(recipes);

      if (recipes.runtimeType == String) {
        _recipes = [];
        setError(recipes);
        setRunning(false);
        return;
      }

      _recipes = recipes;
    }
    catch(error) {
      print("AAAA: $error");
      _recipes = [];
    }

    setRunning(false);
  }
}