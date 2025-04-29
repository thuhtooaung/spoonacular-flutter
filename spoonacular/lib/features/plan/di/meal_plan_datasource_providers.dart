import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/di/service_providers.dart';
import '../data/datasources/local/meal_plan_local_datasource.dart';
import '../data/datasources/local/meal_plan_local_datasource_impl.dart';

final mealPlanLocalDataSource = Provider<MealPlanLocalDataSource>((ref){
  return MealPlanLocalDataSourceImpl(ref.read(databaseProvider).mealPlanDao);
});