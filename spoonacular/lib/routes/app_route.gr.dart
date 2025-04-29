// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

/// generated route for
/// [ChooseSavedRecipeScreen]
class ChooseSavedRecipeRoute extends PageRouteInfo<ChooseSavedRecipeRouteArgs> {
  ChooseSavedRecipeRoute({
    required List<String> ids,
    required dynamic Function(List<RecipeDetail>) onChoose,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ChooseSavedRecipeRoute.name,
         args: ChooseSavedRecipeRouteArgs(
           ids: ids,
           onChoose: onChoose,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ChooseSavedRecipeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChooseSavedRecipeRouteArgs>();
      return ChooseSavedRecipeScreen(args.ids, args.onChoose, key: args.key);
    },
  );
}

class ChooseSavedRecipeRouteArgs {
  const ChooseSavedRecipeRouteArgs({
    required this.ids,
    required this.onChoose,
    this.key,
  });

  final List<String> ids;

  final dynamic Function(List<RecipeDetail>) onChoose;

  final Key? key;

  @override
  String toString() {
    return 'ChooseSavedRecipeRouteArgs{ids: $ids, onChoose: $onChoose, key: $key}';
  }
}

/// generated route for
/// [ChooseWeekScreen]
class ChooseWeekRoute extends PageRouteInfo<void> {
  const ChooseWeekRoute({List<PageRouteInfo>? children})
    : super(ChooseWeekRoute.name, initialChildren: children);

  static const String name = 'ChooseWeekRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChooseWeekScreen();
    },
  );
}

/// generated route for
/// [FavouriteScreen]
class FavouriteRoute extends PageRouteInfo<void> {
  const FavouriteRoute({List<PageRouteInfo>? children})
    : super(FavouriteRoute.name, initialChildren: children);

  static const String name = 'FavouriteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavouriteScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [MealPlanScreen]
class MealPlanRoute extends PageRouteInfo<void> {
  const MealPlanRoute({List<PageRouteInfo>? children})
    : super(MealPlanRoute.name, initialChildren: children);

  static const String name = 'MealPlanRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MealPlanScreen();
    },
  );
}

/// generated route for
/// [RecipeDetailScreen]
class RecipeDetailRoute extends PageRouteInfo<RecipeDetailRouteArgs> {
  RecipeDetailRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
         RecipeDetailRoute.name,
         args: RecipeDetailRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'RecipeDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipeDetailRouteArgs>();
      return RecipeDetailScreen(key: args.key, id: args.id);
    },
  );
}

class RecipeDetailRouteArgs {
  const RecipeDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'RecipeDetailRouteArgs{key: $key, id: $id}';
  }
}
