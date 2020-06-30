import 'package:livrodereceitas/utils/connectity_utils.dart';
import 'package:livrodereceitas/controller/facade.dart';
import 'package:livrodereceitas/models/recipe.dart';
import 'package:livrodereceitas/providers/base_provider.dart';

class RecipeProvider extends BaseProvider {
  List<Recipe> _recipes;
  List<Recipe> get recipes => _recipes;

  Future<void> fetchRecipes() async {
    if(await (await isOnline()))
      return 'offline';

    setRunning(true);

    try {
      final List<Recipe> recipes = await Facade().indexRecipes();

      _recipes = recipes;
    }
    on FormatException catch(error) {
      _recipes = [];
    }

    setRunning(false);
  }
}