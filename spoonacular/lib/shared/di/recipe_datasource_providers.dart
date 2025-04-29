import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'service_providers.dart';
import '../data/datasources/local/recipe_local_datasource.dart';
import '../data/datasources/local/recipe_local_datasource_impl.dart';

final recipeLocalDataSource = Provider<RecipeLocalDataSource>((ref){
  return RecipeLocalDataSourceImpl(ref.read(databaseProvider).recipeDao);
});