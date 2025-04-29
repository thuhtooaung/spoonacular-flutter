import 'package:dio/dio.dart';
import 'package:spoonacular/shared/mappers/recipe_mapper.dart';

import '../../../../shared/data/datasources/local/recipe_local_datasource.dart';
import '../../../../shared/services/remote/dio/error_handler.dart';
import '../../../home/domain/entities/recipe.dart';
import '../../domain/repositories/favourite_repository.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {

  final RecipeLocalDataSource _localDataSource;

  FavouriteRepositoryImpl(this._localDataSource);

  @override
  Stream<List<Recipe>> getFavouriteRecipes()  {
    try {
      final data = _localDataSource.getFavouriteRecipes();
      return data.map((e) => e.map((e) => e.toRecipe()).toList());
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }
}