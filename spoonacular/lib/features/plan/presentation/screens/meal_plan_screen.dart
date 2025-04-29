import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular/core/app_fonts.dart';

import '../../../../routes/app_route.dart';
import '../providers/meal_plan_provider.dart';
import '../widgets/meal_plan_recipes.dart';

@RoutePage()
class MealPlanScreen extends ConsumerStatefulWidget {
  const MealPlanScreen({super.key});

  @override
  ConsumerState createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends ConsumerState<MealPlanScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mealPlanProvider.notifier).initCurrentWeek();
    });
  }

  @override
  Widget build(BuildContext context) {
    var mealPlanState = ref.watch(mealPlanProvider);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Meal Plans"),
          ],
        ),
        actions: [
          Text(
            mealPlanState.currentWeek,
            style: context.appFonts.bodyMedium(),
          ),
          IconButton(
            onPressed: () {
              context.pushRoute(ChooseWeekRoute());
            },
            icon: Icon(Icons.calendar_month),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          var item = mealPlanState.mealPlans[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.day,
                      style: context.appFonts.titleSmall(),
                    ),
                    IconButton(
                      onPressed: () {
                        context.router.push(
                          ChooseSavedRecipeRoute(
                            ids: item.recipes.map((e) => e.id).toList(),
                            onChoose: (values) {
                              ref
                                  .read(mealPlanProvider.notifier)
                                  .addToMealPlan(index, values);
                              context.router.maybePop();
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.edit_outlined),
                    ),
                  ],
                ),
                SizedBox(
                  height: 96.0,
                  child: MealPlanRecipes(
                    recipes: item.recipes,
                    onTap: (value) {
                      context.router.push(
                        RecipeDetailRoute(id: value.id),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1.0,
            color: Colors.black,
          );
        },
        itemCount: mealPlanState.mealPlans.length,
      ),
    );
  }
}
