import '../entities/recipe.dart';

abstract class HomeRecipeRepository {
  Future<List<Recipe>> getRandomRecipes();
}