import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../detail/domain/entities/recipe_detail.dart';
import '../../di/meal_plan_usecase_providers.dart';
import '../../domain/usecases/get_all_recipe_usecase.dart';

class ChooseRecipeState {
  List<RecipeDetail> recipes;

  ChooseRecipeState({
    this.recipes = const [],
  });

  ChooseRecipeState copyWith({
    List<RecipeDetail>? recipes,
  }) {
    return ChooseRecipeState(
      recipes: recipes ?? this.recipes,
    );
  }
}

final chooseSavedRecipeProvider = StateNotifierProvider<ChooseSavedRecipeProvider, ChooseRecipeState>(
  (ref) => ChooseSavedRecipeProvider(
    ref.read(getAllRecipeListUseCase),
  ),
);

class ChooseSavedRecipeProvider extends StateNotifier<ChooseRecipeState> {
  final GetAllRecipeListUseCase _getAllRecipeListUseCase;

  ChooseSavedRecipeProvider(
    this._getAllRecipeListUseCase,
  ) : super(ChooseRecipeState());

  void loadAllRecipes() {
    _getAllRecipeListUseCase.execute().listen((event) {
      state = state.copyWith(recipes: event);
    });
  }
}
