import '../entities/recipe.dart';
import '../repositories/home_recipe_repository.dart';

class GetRecipeByMealTypeUseCase {

  final HomeRecipeRepository _repository;

  GetRecipeByMealTypeUseCase(this._repository);

  Future<List<Recipe>> execute() {
    return _repository.getRandomRecipes();
  }
}
