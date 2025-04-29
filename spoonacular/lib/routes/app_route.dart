import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import '../features/detail/domain/entities/recipe_detail.dart';
import '../features/favourite/presentation/screens/favourite_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/plan/presentation/screens/choose_saved_recipe_screen.dart';
import '../features/plan/presentation/screens/choose_week_screen.dart';
import '../features/plan/presentation/screens/meal_plan_screen.dart';
import '../features/main/screens/main_screen.dart';
import '../features/detail/presentation/screens/recipe_detail_screen.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
            AutoRoute(page: FavouriteRoute.page, path: 'favourite'),
            AutoRoute(page: MealPlanRoute.page, path: 'mealPlan'),
          ],
        ),
        AutoRoute(page: RecipeDetailRoute.page, path: '/recipeDetail'),
        AutoRoute(page: ChooseSavedRecipeRoute.page, path: '/chooseRecipe'),
        AutoRoute(page: ChooseWeekRoute.page, path: '/chooseWeek'),
      ];
}
