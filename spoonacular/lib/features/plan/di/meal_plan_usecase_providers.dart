import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/usecases/get_all_meal_plan_usecase.dart';
import '../domain/usecases/get_all_recipe_usecase.dart';
import '../domain/usecases/update_meal_plan_usecase.dart';
import 'meal_plan_repository_providers.dart';

final getAllMealPlanUseCase = Provider<GetAllMealPlanUseCase>((ref){
  return GetAllMealPlanUseCase(ref.read(mealPlanRepository));
});

final getAllRecipeListUseCase = Provider<GetAllRecipeListUseCase>((ref){
  return GetAllRecipeListUseCase(ref.read(mealPlanRepository));
});

final updateMealPlanUseCase = Provider<UpdateMealPlanUseCase>((ref){
  return UpdateMealPlanUseCase(ref.read(mealPlanRepository));
});