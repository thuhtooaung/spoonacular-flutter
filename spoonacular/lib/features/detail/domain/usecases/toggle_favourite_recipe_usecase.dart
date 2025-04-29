import '../entities/recipe_detail.dart';
import '../repositories/recipe_detail_repository.dart';

class ToggleFavouriteRecipeUseCase {
  final RecipeDetailRepository _repository;

  ToggleFavouriteRecipeUseCase(this._repository);

  Future<void> execute(RecipeDetail entity) {
    return _repository.updateRecipe(entity);
  }
}
