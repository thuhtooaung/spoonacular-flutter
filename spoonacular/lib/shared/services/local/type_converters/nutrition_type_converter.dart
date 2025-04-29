import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../data/models/local/recipe_detail_entity.dart';

class NutritionTypeConverter extends TypeConverter<NutritionEntity, String> {
  @override
  NutritionEntity fromSql(String fromDb) {
    return NutritionEntity.fromJson(json.decode(fromDb));
  }

  @override
  String toSql(NutritionEntity value) {
    return json.encode(value);
  }
}
