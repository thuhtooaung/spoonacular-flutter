import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular/features/search/di/search_recipes_datasource_providers.dart';

import '../data/repositories/search_recipes_repository_impl.dart';
import '../domain/repositories/search_recipes_repository.dart';

final searchRecipesRepository = Provider<SearchRecipesRepository>((ref){
  return SearchRecipesRepositoryImpl(
    ref.read(searchRecipesRemoteDataSource),
  );
});