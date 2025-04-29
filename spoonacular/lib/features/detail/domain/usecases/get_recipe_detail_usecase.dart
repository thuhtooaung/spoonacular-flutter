import '../entities/recipe_detail.dart';
import '../repositories/recipe_detail_repository.dart';

class GetRecipeDetailUseCase {
  final RecipeDetailRepository _repository;

  GetRecipeDetailUseCase(this._repository);

  Future<RecipeDetail> execute(String id) {
    return _repository.getRecipeDetail(id);
  }
}
