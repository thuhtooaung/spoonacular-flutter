import '../../models/meal_plan_entity.dart';

abstract class MealPlanLocalDataSource {
  Stream<List<MealPlanEntity>> getMealPlans();
  Future<void> insertMealPlan(MealPlanEntity entity);
}