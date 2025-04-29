import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/usecases/get_favourite_recipe_usecase.dart';
import 'favourite_repository_providers.dart';

final getFavouriteRecipeUseCase = Provider<GetFavouriteRecipeUseCase>((ref){
  return GetFavouriteRecipeUseCase(
    ref.read(favouriteRepository),
  );
});