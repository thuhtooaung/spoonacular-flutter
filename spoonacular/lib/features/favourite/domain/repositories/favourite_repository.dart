import '../../../home/domain/entities/recipe.dart';

abstract class FavouriteRepository {
  Stream<List<Recipe>> getFavouriteRecipes();
}