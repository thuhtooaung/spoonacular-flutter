import '../../../home/domain/entities/recipe.dart';
import '../repositories/favourite_repository.dart';

class GetFavouriteRecipeUseCase {
  final FavouriteRepository _repository;

  GetFavouriteRecipeUseCase(this._repository);

  Stream<List<Recipe>> execute() {
    return _repository.getFavouriteRecipes();
  }
}
