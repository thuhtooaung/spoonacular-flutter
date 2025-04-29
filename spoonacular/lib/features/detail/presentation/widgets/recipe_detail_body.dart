import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/features/detail/presentation/widgets/recipe_info.dart';
import '../../../../core/core.dart';
import '../../domain/entities/recipe_detail.dart';

class RecipeDetailInfo extends StatelessWidget {
  const RecipeDetailInfo({super.key, required this.recipe});

  final RecipeDetail recipe;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(kMargin16),
              child: CachedNetworkImage(
                imageUrl: recipe.image,
              ),
            ),
            Text(
              recipe.name,
              style: context.appFonts.titleMedium(),
            ),
            RecipeNutrition(
              nutrients: recipe.nutrition,
            ),
            RecipeInfo(
              label: "Health Score",
              value: recipe.healthScore,
            ),
            RecipeInfo(
              label: "Taking Time",
              value: "${recipe.takingTime} (minutes)",
            ),
            RecipeIngredients(
              ingredients: recipe.ingredients,
            ),
            RecipeInstruction(
              instruction: recipe.instructions,
            ),
            RecipeInstructionSteps(
              steps: recipe.instructionSteps.firstOrNull?.steps ?? [],
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeNutrition extends StatelessWidget {
  const RecipeNutrition({
    super.key,
    required this.nutrients,
  });

  final List<Nutrition> nutrients;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nutrition",
          style: context.appFonts.titleSmall(),
        ),
        ...nutrients.map(
          (e) => RecipeInfo(
            label: e.name,
            value: "${e.amount} ${e.unitName}",
          ),
        ),
      ],
    );
  }
}

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({
    super.key,
    required this.ingredients,
  });

  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ingredients",
          style: context.appFonts.titleSmall(),
        ),
        ...ingredients.map(
          (e) => RecipeInfo(
            label: e.name,
            value: "${e.amount} ${e.unitName}",
          ),
        ),
      ],
    );
  }
}

class RecipeInstruction extends StatelessWidget {
  const RecipeInstruction({
    super.key,
    required this.instruction,
  });

  final String instruction;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Instruction",
          style: context.appFonts.titleSmall(),
        ),
        Text(
          instruction,
          style: context.appFonts.bodyMedium(),
        ),
      ],
    );
  }
}

class RecipeInstructionSteps extends StatelessWidget {
  final List<InstructionStep> steps;

  const RecipeInstructionSteps({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Steps",
          style: context.appFonts.titleSmall(),
        ),
        ...steps.map(
          (e) => Card(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 8.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Step ${e.number}",
                    style: context.appFonts.titleSmall(),
                  ),
                  Text(
                    e.step,
                    style: context.appFonts.bodyMedium(),
                  ),
                  if (e.ingredients.isNotEmpty)
                    Text(
                      "Ingredients",
                      style: context.appFonts.titleSmall(),
                    ),
                  ...e.ingredients.map(
                    (i) => Row(
                      spacing: 8.0,
                      children: [
                        CachedNetworkImage(
                          imageUrl: "https://img.spoonacular.com/ingredients_100x100/${i.image}",
                          width: 48.0,
                          height: 48.0,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          i.name,
                          style: context.appFonts.bodyMedium(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
