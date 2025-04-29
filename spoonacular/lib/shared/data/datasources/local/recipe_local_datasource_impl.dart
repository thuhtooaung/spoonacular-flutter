import 'package:spoonacular/shared/data/datasources/local/recipe_local_datasource.dart';

import '../../../../../shared/services/local/dao/recipe_dao.dart';
import '../../models/local/recipe_detail_entity.dart';

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
  final RecipeDao _dao;
  RecipeLocalDataSourceImpl(this._dao);

  @override
  Future<RecipeDetailEntity?> getRecipeDetail(String id) {
    return _dao.get(id);
  }

  @override
  Future<void> update(RecipeDetailEntity entity) {
    return _dao.insert(entity);
  }

  @override
  Stream<List<RecipeDetailEntity>> getFavouriteRecipes() {
    return _dao.getFavouriteRecipes();
  }

  Stream<List<RecipeDetailEntity>> getAllData() {
    return _dao.getAllData();
  }

}