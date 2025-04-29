import 'package:spoonacular/shared/services/remote/base_api_service.dart';

import '../../models/search_recipe_response.dart';
import '../../../../../shared/services/remote/api_const.dart';

class SearchRecipesApiService extends BaseApiService {
  SearchRecipesApiService({required super.dio});

  Future<SearchRecipeResponse> searchRecipeByIngredients(String ingredients) async {
    return await getServerCall(
      SearchRecipeResponse(),
      ApiConst.pathSearchRecipeByIngredients(ingredients),
    );
  }
}