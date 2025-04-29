import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/di/recipe_datasource_providers.dart';
import '../data/repositories/meal_plan_repository_impl.dart';
import '../domain/repositories/meal_plan_repository.dart';
import 'meal_plan_datasource_providers.dart';

final mealPlanRepository = Provider<MealPlanRepository>((ref){
  return MealPlanRepositoryImpl(
    ref.read(recipeLocalDataSource),
    ref.read(mealPlanLocalDataSource),
  );
});