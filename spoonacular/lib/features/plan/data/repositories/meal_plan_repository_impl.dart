import 'package:spoonacular/features/plan/mappers/meal_plan_mapper.dart';
import 'package:spoonacular/shared/mappers/recipe_detail_mapper.dart';

import '../../../../shared/data/datasources/local/recipe_local_datasource.dart';
import '../../../detail/domain/entities/recipe_detail.dart';
import '../../domain/entities/meal_plan.dart';
import '../../domain/repositories/meal_plan_repository.dart';
import '../datasources/local/meal_plan_local_datasource.dart';

class MealPlanRepositoryImpl extends MealPlanRepository {
  final RecipeLocalDataSource _recipeLocalDataSource;
  final MealPlanLocalDataSource _mealPlanLocalDataSource;

  MealPlanRepositoryImpl(this._recipeLocalDataSource, this._mealPlanLocalDataSource);

  @override
  Stream<List<RecipeDetail>> getRecipesList() {
    final data = _recipeLocalDataSource.getFavouriteRecipes();
    return data.map((e) => e.map((f) => f.toRecipeDetail()).toList());
  }

  @override
  Stream<List<MealPlan>> getAllMealPlan() {
    final data = _mealPlanLocalDataSource.getMealPlans();
    return data.map((e) => e.map((e) => e.toMealPlan()).toList());
  }

  @override
  Future<void> insertMealPlan(MealPlan plan) {
    return _mealPlanLocalDataSource.insertMealPlan(plan.toEntity());
  }
}
