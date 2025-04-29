import 'package:dio/dio.dart';
import 'package:spoonacular/features/search/data/datasources/remote/search_recipes_remote_datasource.dart';
import 'package:spoonacular/features/search/domain/repositories/search_recipes_repository.dart';
import 'package:spoonacular/features/search/mappers/search_recipe_mapper.dart';

import '../../../../shared/services/remote/dio/error_handler.dart';
import '../../../home/domain/entities/recipe.dart';

class SearchRecipesRepositoryImpl implements SearchRecipesRepository {

  final SearchRecipesRemoteDataSource _remoteDataSource;

  SearchRecipesRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Recipe>> searchRecipeByIngredients(String ingredients) async {
    try {
      var result = await _remoteDataSource.searchRecipeByIngredients(ingredients);
      return result.map((e) => e.toRecipe()).toList();
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }
}