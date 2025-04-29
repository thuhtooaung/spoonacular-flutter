import '../../../detail/domain/entities/recipe_detail.dart';
import '../repositories/meal_plan_repository.dart';

class GetAllRecipeListUseCase {
  final MealPlanRepository _recipeRepository;

  GetAllRecipeListUseCase(this._recipeRepository);

  Stream<List<RecipeDetail>> execute() {
    return _recipeRepository.getRecipesList();
  }
}
