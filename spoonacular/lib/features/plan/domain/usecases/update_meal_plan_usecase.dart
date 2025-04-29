import '../entities/meal_plan.dart';
import '../repositories/meal_plan_repository.dart';

class UpdateMealPlanUseCase {
  final MealPlanRepository _recipeRepository;

  UpdateMealPlanUseCase(this._recipeRepository);

  Future<void> execute(MealPlan plan) {
    return _recipeRepository.insertMealPlan(plan);
  }
}
