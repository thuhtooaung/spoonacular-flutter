import '../../models/local/recipe_detail_entity.dart';

abstract class RecipeLocalDataSource {
  Future<RecipeDetailEntity?> getRecipeDetail(String id);
  Future<void> update(RecipeDetailEntity entity);
  Stream<List<RecipeDetailEntity>> getFavouriteRecipes();
}
