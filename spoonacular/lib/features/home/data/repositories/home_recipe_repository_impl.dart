import 'package:dio/dio.dart';
import 'package:spoonacular/shared/mappers/recipe_mapper.dart';

import '../../../../shared/services/remote/dio/error_handler.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/repositories/home_recipe_repository.dart';
import '../datasources/remote/home_recipe_remote_datasource.dart';

class HomeRecipeRepositoryImpl implements HomeRecipeRepository {

  final HomeRecipeRemoteDataSource _remoteDataSource;

  HomeRecipeRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Recipe>> getRandomRecipes() async {
    try {
      var res = await _remoteDataSource.getRandomRecipes();
      return res.map((e) => e.toRecipe()).toList();
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }
}