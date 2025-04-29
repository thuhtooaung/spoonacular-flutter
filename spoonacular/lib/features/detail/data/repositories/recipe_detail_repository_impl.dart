import 'package:dio/dio.dart';
import 'package:spoonacular/shared/mappers/recipe_detail_mapper.dart';

import '../../../../shared/data/datasources/local/recipe_local_datasource.dart';
import '../../../../shared/services/remote/dio/error_handler.dart';
import '../../domain/entities/recipe_detail.dart';
import '../../domain/repositories/recipe_detail_repository.dart';
import '../datasources/remote/recipe_detail_remote_datasource.dart';

class RecipeDetailRepositoryImpl implements RecipeDetailRepository {
  final RecipeDetailRemoteDataSource _remoteDataSource;
  final RecipeLocalDataSource _localDataSource;

  RecipeDetailRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<RecipeDetail> getRecipeDetail(String id) async {
    try {
      var entity = await _localDataSource.getRecipeDetail(id);
      if (entity != null) return entity.toRecipeDetail();
      if (entity == null) {
        var result = await _remoteDataSource.getRecipeDetail(id);
        await _localDataSource.update(result.toEntity());
        return result.toRecipeDetail();
      } else {
        return entity.toRecipeDetail();
      }
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> updateRecipe(RecipeDetail entity) async {
    try {
      return await _localDataSource.update(entity.toEntity());
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }

}
