import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular/features/detail/di/recipe_detail_repository_providers.dart';

import '../domain/usecases/get_recipe_detail_usecase.dart';
import '../domain/usecases/toggle_favourite_recipe_usecase.dart';

final getRecipeDetailUseCase = Provider<GetRecipeDetailUseCase>((ref){
  return GetRecipeDetailUseCase(ref.read(recipeDetailRepository));
});

final toggleFavouriteRecipeUseCase = Provider<ToggleFavouriteRecipeUseCase>((ref){
  return ToggleFavouriteRecipeUseCase(
    ref.read(recipeDetailRepository),
  );
});