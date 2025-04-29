import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular/core/app_colors.dart';
import 'package:spoonacular/core/app_fonts.dart';

import '../providers/meal_plan_provider.dart';

@RoutePage()
class ChooseWeekScreen extends ConsumerWidget {
  const ChooseWeekScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealPlanState = ref.watch(mealPlanProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Week"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: 16.0,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                ref.read(mealPlanProvider.notifier).switchPreviousWeek();
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              child: SizedBox(
                width: 200.0,
                child: Text(
                  "Previous Week",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 248.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: context.appColors.primaryColor,
                ),
              ),
              child: Text(
                textAlign: TextAlign.center,
                mealPlanState.currentWeek,
                style: context.appFonts.titleMedium()?.copyWith(
                      color: context.appColors.primaryColor,
                    ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                ref.read(mealPlanProvider.notifier).switchNextWeek();
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              child: SizedBox(
                width: 200.0,
                child: Text(
                  "Next Week",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
