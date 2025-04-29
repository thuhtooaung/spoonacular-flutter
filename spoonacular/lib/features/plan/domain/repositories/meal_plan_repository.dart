import '../../../detail/domain/entities/recipe_detail.dart';
import '../entities/meal_plan.dart';

abstract class MealPlanRepository {
  Stream<List<RecipeDetail>> getRecipesList();
  Future<void> insertMealPlan(MealPlan plan);
  Stream<List<MealPlan>> getAllMealPlan();
}