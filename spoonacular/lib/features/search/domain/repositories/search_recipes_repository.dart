import '../../../home/domain/entities/recipe.dart';

abstract class SearchRecipesRepository {
  Future<List<Recipe>> searchRecipeByIngredients(String ingredients);
}