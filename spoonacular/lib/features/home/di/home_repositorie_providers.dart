import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/home_recipe_repository_impl.dart';
import '../domain/repositories/home_recipe_repository.dart';
import 'home_datasource_providers.dart';

final homeRecipeRepository = Provider<HomeRecipeRepository>((ref){
  return HomeRecipeRepositoryImpl(
    ref.read(homeRecipeRemoteDataSource),
  );
});