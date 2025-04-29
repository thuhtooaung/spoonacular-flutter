import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/home_usecase_providers.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/usecases/get_recipe_by_meal_type_usecase.dart';

enum HomeProviderStatus { initial, loading, success, error }

class HomeProviderState {
  final HomeProviderStatus status;
  final List<Recipe> recipes;

  HomeProviderState({
    this.status = HomeProviderStatus.initial,
    this.recipes = const [],
  });

  HomeProviderState copyWith({
    HomeProviderStatus? status,
    List<Recipe>? recipes,
  }) {
    return HomeProviderState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
    );
  }
}

final homeProvider = StateNotifierProvider<HomeProvider, HomeProviderState>(
  (ref) => HomeProvider(
    ref.read(getRecipeByMealTypeUseCase),
  ),
);

class HomeProvider extends StateNotifier<HomeProviderState> {
  final GetRecipeByMealTypeUseCase _getRecipeByMealTypeUseCase;

  HomeProvider(
    this._getRecipeByMealTypeUseCase,
  ) : super(HomeProviderState());

  Future<void> initHomeRecipe() async {
    state = state.copyWith(
      status: HomeProviderStatus.loading,
    );
    try {
      var result = await _getRecipeByMealTypeUseCase.execute();
      state = state.copyWith(
        status: HomeProviderStatus.success,
        recipes: result,
      );
    } on Exception catch (_) {
      state = state.copyWith(status: HomeProviderStatus.error);
    } catch (e) {
      state = state.copyWith(status: HomeProviderStatus.error);
    }
  }

}
