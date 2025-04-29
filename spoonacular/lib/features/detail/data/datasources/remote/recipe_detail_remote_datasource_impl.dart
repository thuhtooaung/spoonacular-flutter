import 'package:dio/dio.dart';
import 'package:spoonacular/features/detail/data/datasources/remote/recipe_detail_api_service.dart';
import 'package:spoonacular/features/detail/data/datasources/remote/recipe_detail_remote_datasource.dart';

import '../../../../../shared/data/models/remote/recipe_detail_response.dart';
import '../../../../../shared/services/remote/dio/error_handler.dart';

class RecipeDetailRemoteDatasourceImpl implements RecipeDetailRemoteDataSource {
  final RecipeDetailApiService _apiService;

  RecipeDetailRemoteDatasourceImpl(this._apiService);

  @override
  Future<RecipeDetailResponse> getRecipeDetail(String id) async {
    try {
      var result = await _apiService.getRecipeDetail(id);
      return result;
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }
}