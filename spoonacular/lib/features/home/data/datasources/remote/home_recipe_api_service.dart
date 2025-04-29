import '../../../../../shared/services/remote/base_api_service.dart';
import '../../models/recipe_response.dart';
import '../../../../../shared/services/remote/api_const.dart';

class HomeRecipeApiService extends BaseApiService {
  HomeRecipeApiService({required super.dio});

  Future<RecipeResponse> getRandomRecipes() async {
    return await getServerCall(
      RecipeResponse(),
      ApiConst.pathGetRecipeRandom(),
    );
  }

}