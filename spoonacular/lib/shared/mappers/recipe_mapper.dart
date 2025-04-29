import '../../features/home/domain/entities/recipe.dart';
import '../data/models/local/recipe_detail_entity.dart';
import '../data/models/remote/recipe_detail_response.dart';

extension  RecipeDetailEntityMapper on RecipeDetailEntity {
  Recipe toRecipe() {
    return Recipe(
      id: id,
      name: title,
      image: image,
      likeCount: aggregateLikes.toString(),
      timeTaken: readyInMinutes.toString(),
    );
  }
}

extension RecipeDetailResponseMapper on RecipeDetailResponse {
  Recipe toRecipe() {
    return Recipe(
      id: id.toString(),
      name: title ?? "",
      image: image ?? "",
      likeCount: (aggregateLikes ?? 0).toString(),
      timeTaken: (readyInMinutes ?? 0).toString(),
    );
  }
}
