import '../../models/search_recipe_response.dart';

abstract class SearchRecipesRemoteDataSource {
  Future<List<SearchRecipeModel>> searchRecipeByIngredients(String ingredients);
}