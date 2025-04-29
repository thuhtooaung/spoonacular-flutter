import 'package:drift/drift.dart';
import '../../../../features/plan/data/models/meal_plan_entity.dart';
import '../type_converters/recipe_detail_converter.dart';

@UseRowClass(MealPlanEntity, generateInsertable: true)
class MealPlanTable extends Table {
  TextColumn get planDate => text()();

  TextColumn get day => text()();

  TextColumn get recipes => text().map(RecipeDetailConverter())();

  @override
  Set<Column<Object>>? get primaryKey => {planDate};

  @override
  String? get tableName => "meal_plan_table";
}
