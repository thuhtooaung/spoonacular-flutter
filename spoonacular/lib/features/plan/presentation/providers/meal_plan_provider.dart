import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../utils/utils.dart';
import '../../../detail/domain/entities/recipe_detail.dart';
import '../../di/meal_plan_usecase_providers.dart';
import '../../domain/entities/meal_plan.dart';
import '../../domain/usecases/get_all_meal_plan_usecase.dart';
import '../../domain/usecases/update_meal_plan_usecase.dart';

enum MealPlanStatus { initial, loading, success, error }

class MealPlanState {
  final MealPlanStatus status;
  final List<MealPlan> mealPlans;
  final DateTime? currentDate;
  final String currentWeek;

  MealPlanState({
    this.status = MealPlanStatus.initial,
    this.mealPlans = const [],
    this.currentDate,
    this.currentWeek = '',
  });

  MealPlanState copyWith({
    MealPlanStatus? status,
    List<MealPlan>? mealPlans,
    List<DateTime>? dates,
    int? currentWeek,
    DateTime? currentDate,
    String? weeklyText,
  }) {
    return MealPlanState(
      status: status ?? this.status,
      mealPlans: mealPlans ?? this.mealPlans,
      currentDate: currentDate ?? this.currentDate,
      currentWeek: weeklyText ?? this.currentWeek,
    );
  }
}

final mealPlanProvider = StateNotifierProvider<MealPlanProvider, MealPlanState>(
  (ref) => MealPlanProvider(
    ref.read(getAllMealPlanUseCase),
    ref.read(updateMealPlanUseCase),
  ),
);

class MealPlanProvider extends StateNotifier<MealPlanState> {
  final GetAllMealPlanUseCase _getMealPlanUseCase;
  final UpdateMealPlanUseCase _updateMealPlanUseCase;

  MealPlanProvider(
    this._getMealPlanUseCase,
    this._updateMealPlanUseCase,
  ) : super(MealPlanState());

  void initCurrentWeek() {
    state = state.copyWith(status: MealPlanStatus.loading);
    DateTime currentDate = DateTime.now();
    List<DateTime> dates = Utils.getCurrentWeek(currentDate);
    _initMealPlan(dates, currentDate);
  }

  void _initMealPlan(List<DateTime> dates, DateTime currentDate) {
    _getMealPlanUseCase.execute().listen((event) {
      List<MealPlan> mealPlanList = [];
      for (var element in dates) {
        var mealPlan = event
            .where((mealPlan) => mealPlan.planDate == Utils.formatDate(element))
            .singleOrNull;
        if (mealPlan != null) {
          mealPlanList.add(mealPlan);
          continue;
        } else {
          mealPlanList.add(
            MealPlan(
              planDate: Utils.formatDate(element),
              day: DateFormat('EEEE').format(element),
              recipes: [],
            ),
          );
        }
      }
      var weeklyText = "${Utils.formatDayAndMonth(dates.first)} - ${Utils.formatDayAndMonth(dates.last)}";
      state = state.copyWith(
        status: MealPlanStatus.success,
        mealPlans: mealPlanList,
        dates: dates,
        currentDate: currentDate,
        weeklyText: weeklyText,
      );
    });
  }

  void switchNextWeek() {
    DateTime currentDate = state.currentDate ?? DateTime.now();
    currentDate = currentDate.add(const Duration(days: 7));
    List<DateTime> dates = Utils.getCurrentWeek(currentDate);
    _initMealPlan(dates, currentDate);
  }

  void switchPreviousWeek() {
    DateTime currentDate = state.currentDate ?? DateTime.now();
    currentDate = currentDate.add(const Duration(days: -7));
    List<DateTime> dates = Utils.getCurrentWeek(currentDate);
    _initMealPlan(dates, currentDate);
  }

  void addToMealPlan(int index, List<RecipeDetail> recipes) {
    state = state.copyWith(status: MealPlanStatus.loading);
    var mealPlanList = state.mealPlans;
    var mealPlan = mealPlanList[index];
    var recipesList = recipes;
    mealPlan.recipes = recipesList;
    state = state.copyWith(mealPlans: mealPlanList);
    _updateMealPlan(mealPlan);
  }

  Future<void> _updateMealPlan(MealPlan entity) async {
    await _updateMealPlanUseCase.execute(entity);
  }
}
