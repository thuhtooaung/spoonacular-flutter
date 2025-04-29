import '../../../../../shared/data/models/remote/recipe_detail_response.dart';

abstract class HomeRecipeRemoteDataSource {
  Future<List<RecipeDetailResponse>> getRandomRecipes();
}