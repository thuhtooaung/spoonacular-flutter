import '../../home/domain/entities/recipe.dart';
import '../data/models/search_recipe_response.dart';

extension SearchRecipeModelMapper on SearchRecipeModel {
  Recipe toRecipe() {
    return Recipe(
      id: id.toString(),
      name: title ?? "",
      image: image ?? "",
      likeCount: (likes ?? 0).toString(),
      timeTaken: "0",
    );
  }
}
