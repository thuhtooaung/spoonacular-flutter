import '../../../../../shared/data/models/remote/recipe_detail_response.dart';

abstract class RecipeDetailRemoteDataSource {
  Future<RecipeDetailResponse> getRecipeDetail(String id);
}