import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/usecases/get_recipe_by_meal_type_usecase.dart';
import 'home_repositorie_providers.dart';

final getRecipeByMealTypeUseCase = Provider<GetRecipeByMealTypeUseCase>((ref){
  return GetRecipeByMealTypeUseCase(
    ref.read(homeRecipeRepository),
  );
});