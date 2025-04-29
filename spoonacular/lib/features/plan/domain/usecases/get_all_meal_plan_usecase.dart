import '../entities/meal_plan.dart';
import '../repositories/meal_plan_repository.dart';

class GetAllMealPlanUseCase {
  final MealPlanRepository _recipeRepository;

  GetAllMealPlanUseCase(this._recipeRepository);

  Stream<List<MealPlan>> execute() {
    return _recipeRepository.getAllMealPlan();
  }
}
