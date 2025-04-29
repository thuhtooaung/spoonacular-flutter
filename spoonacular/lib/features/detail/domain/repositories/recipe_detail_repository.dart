import '../entities/recipe_detail.dart';

abstract class RecipeDetailRepository {
  Future<RecipeDetail> getRecipeDetail(String id);
  Future<void> updateRecipe(RecipeDetail entity);
}