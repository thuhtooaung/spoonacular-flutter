import '../../../detail/domain/entities/recipe_detail.dart';

class MealPlan {
  final String planDate;
  final String day;
  List<RecipeDetail> recipes;

  MealPlan({
    required this.planDate,
    required this.day,
    required this.recipes,
  });
}
