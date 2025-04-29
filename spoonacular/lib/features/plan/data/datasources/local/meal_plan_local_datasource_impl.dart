import '../../../../../shared/services/local/dao/meal_plan_dao.dart';
import '../../models/meal_plan_entity.dart';
import 'meal_plan_local_datasource.dart';

class MealPlanLocalDataSourceImpl extends MealPlanLocalDataSource {
  final MealPlanDao _dao;

  MealPlanLocalDataSourceImpl(this._dao);

  @override
  Stream<List<MealPlanEntity>> getMealPlans() {
    return _dao.getAllData();
  }

  @override
  Future<void> insertMealPlan(MealPlanEntity entity) {
    return _dao.insert(entity);
  }
}
