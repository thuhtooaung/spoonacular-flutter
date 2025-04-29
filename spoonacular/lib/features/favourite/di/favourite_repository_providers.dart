import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/di/recipe_datasource_providers.dart';
import '../data/repositories/favourite_repository_impl.dart';
import '../domain/repositories/favourite_repository.dart';

final favouriteRepository = Provider<FavouriteRepository>((ref){
  return FavouriteRepositoryImpl(
    ref.read(recipeLocalDataSource),
  );
});