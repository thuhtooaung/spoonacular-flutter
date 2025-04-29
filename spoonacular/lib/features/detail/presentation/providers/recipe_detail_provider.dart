import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/recipe_detail_usecase_providers.dart';
import '../../domain/entities/recipe_detail.dart';
import '../../domain/usecases/get_recipe_detail_usecase.dart';
import '../../domain/usecases/toggle_favourite_recipe_usecase.dart';

enum RecipeDetailStatus { initial, loading, success, error }

class RecipeDetailState {
  final RecipeDetailStatus status;
  final RecipeDetail? recipe;
  final String msg;

  RecipeDetailState({
    this.status = RecipeDetailStatus.initial,
    this.recipe,
    this.msg = "",
  });

  RecipeDetailState copyWith({
    RecipeDetailStatus? status,
    RecipeDetail? recipe,
    String? msg,
  }) {
    return RecipeDetailState(
      status: status ?? this.status,
      recipe: recipe ?? this.recipe,
      msg: msg ?? this.msg,
    );
  }
}

final recipeDetailProvider = StateNotifierProvider<RecipeDetailProvider, RecipeDetailState>(
  (ref) => RecipeDetailProvider(
    ref.read(getRecipeDetailUseCase),
    ref.read(toggleFavouriteRecipeUseCase),
  ),
);

class RecipeDetailProvider extends StateNotifier<RecipeDetailState> {
  final GetRecipeDetailUseCase _getRecipeDetailUseCase;
  final ToggleFavouriteRecipeUseCase _toggleFavouriteRecipeUseCase;

  RecipeDetailProvider(
    this._getRecipeDetailUseCase,
    this._toggleFavouriteRecipeUseCase,
  ) : super(RecipeDetailState());

  Future<void> getRecipeDetail(String id) async {
    state = state.copyWith(status: RecipeDetailStatus.loading);
    try {
      var result = await _getRecipeDetailUseCase.execute(id);
      state = state.copyWith(
        status: RecipeDetailStatus.success,
        recipe: result,
      );
    } catch (e){
      state = state.copyWith(
        status: RecipeDetailStatus.error,
        msg: "Failed to load recipe",
      );
    }
  }

  Future<void> toggleFavorite() async {
    var entity = state.recipe;
    if (entity == null) return;
    entity.isFavourite = !entity.isFavourite;
    state = state.copyWith(recipe: entity);
    await _toggleFavouriteRecipeUseCase.execute(entity);
  }
}
