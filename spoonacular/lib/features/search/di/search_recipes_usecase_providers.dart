import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular/features/search/di/search_recipes_repository_providers.dart';

import '../domain/usecases/search_recipe_by_ingredient_usecase.dart';

final searchRecipeByIngredientUseCaseProvider = Provider<SearchRecipeByIngredientUseCase>((ref){
  return SearchRecipeByIngredientUseCase(
    ref.read(searchRecipesRepository),
  );
});