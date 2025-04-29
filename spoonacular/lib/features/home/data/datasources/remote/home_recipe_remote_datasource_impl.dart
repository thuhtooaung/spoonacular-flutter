import 'package:dio/dio.dart';

import '../../../../../shared/data/models/remote/recipe_detail_response.dart';
import '../../../../../shared/services/remote/dio/error_handler.dart';
import 'home_recipe_api_service.dart';
import 'home_recipe_remote_datasource.dart';

class HomeRecipeRemoteDataSourceImpl implements HomeRecipeRemoteDataSource {

  final HomeRecipeApiService _apiService;

  HomeRecipeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<RecipeDetailResponse>> getRandomRecipes() async {
    try {
      var res = await _apiService.getRandomRecipes();
      return res.results ?? [];
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }
}