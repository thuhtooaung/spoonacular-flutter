import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular/features/detail/di/recipe_detail_service_providers.dart';

import '../data/datasources/remote/recipe_detail_remote_datasource.dart';
import '../data/datasources/remote/recipe_detail_remote_datasource_impl.dart';

final recipeDetailRemoteDataSource = Provider<RecipeDetailRemoteDataSource>((ref){
  return RecipeDetailRemoteDatasourceImpl(
    ref.read(recipeDetailApiService),
  );
});