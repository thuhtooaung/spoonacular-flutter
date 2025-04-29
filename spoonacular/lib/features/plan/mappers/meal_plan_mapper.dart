import 'package:spoonacular/shared/mappers/recipe_detail_mapper.dart';

import '../data/models/meal_plan_entity.dart';
import '../domain/entities/meal_plan.dart';

extension MealPlanEntityMapper on MealPlanEntity {
  MealPlan toMealPlan() {
    return MealPlan(
      planDate: planDate,
      day: day,
      recipes: recipes.map((e) => e.toRecipeDetail()).toList(),
    );
  }
}

extension MealPlanMapper on MealPlan {
  MealPlanEntity toEntity() {
    return MealPlanEntity(
      planDate: planDate,
      day: day,
      recipes: recipes.map((e) => e.toEntity()).toList(),
    );
  }
}
