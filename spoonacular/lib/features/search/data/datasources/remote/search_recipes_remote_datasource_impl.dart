import 'package:dio/dio.dart';
import 'package:spoonacular/features/search/data/datasources/remote/search_recipes_api_service.dart';
import 'package:spoonacular/features/search/data/datasources/remote/search_recipes_remote_datasource.dart';

import '../../models/search_recipe_response.dart';
import '../../../../../shared/services/remote/dio/error_handler.dart';

class SearchRecipesRemoteDataSourceImpl implements SearchRecipesRemoteDataSource {
  final SearchRecipesApiService _apiService;

  SearchRecipesRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<SearchRecipeModel>> searchRecipeByIngredients(String ingredients) async {
    try {
      var result = await _apiService.searchRecipeByIngredients(ingredients);
      return result.results ?? [];
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }
}