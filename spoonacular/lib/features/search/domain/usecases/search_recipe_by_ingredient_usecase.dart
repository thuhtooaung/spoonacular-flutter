import '../../../home/domain/entities/recipe.dart';
import '../repositories/search_recipes_repository.dart';

class SearchRecipeByIngredientUseCase {
  final SearchRecipesRepository _repository;

  SearchRecipeByIngredientUseCase(this._repository);

  Future<List<Recipe>> execute(String ingredients) {
    return _repository.searchRecipeByIngredients(ingredients);
  }
}
