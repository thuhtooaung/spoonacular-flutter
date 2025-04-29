import '../../../../../shared/data/models/remote/recipe_detail_response.dart';
import '../../../../../shared/services/remote/api_const.dart';
import '../../../../../shared/services/remote/base_api_service.dart';

class RecipeDetailApiService extends BaseApiService {
  RecipeDetailApiService({required super.dio});

  Future<RecipeDetailResponse> getRecipeDetail(String id) async {
    return await getServerCall(
      RecipeDetailResponse(),
      ApiConst.pathGetRecipeDetail(id),
    );
  }

}