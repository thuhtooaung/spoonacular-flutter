import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular/features/detail/di/recipe_detail_datasource_providers.dart';

import '../../../shared/di/recipe_datasource_providers.dart';
import '../data/repositories/recipe_detail_repository_impl.dart';
import '../domain/repositories/recipe_detail_repository.dart';

final recipeDetailRepository = Provider<RecipeDetailRepository>((ref){
  return RecipeDetailRepositoryImpl(
    ref.read(recipeDetailRemoteDataSource),
    ref.read(recipeLocalDataSource)
  );
});