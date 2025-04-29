import 'package:spoonacular/shared/data/models/remote/recipe_detail_response.dart' as rds;

import '../../features/detail/domain/entities/recipe_detail.dart';
import '../data/models/local/recipe_detail_entity.dart';

extension RecipeDetailEntityMapper on RecipeDetailEntity {
  RecipeDetail toRecipeDetail() {
    return RecipeDetail(
      id: id,
      name: title,
      image: image,
      likeCount: aggregateLikes.toString(),
      takingTime: readyInMinutes.toString(),
      healthScore: healthScore.toString(),
      nutrition: nutrition.nutrients.map((e) => e.toNutrition()).toList(),
      ingredients: extendedIngredients.map((e) => e.toIngredient()).toList(),
      instructions: instructions,
      instructionSteps:
          analyzedInstructions.map((e) => e.toAnalyzedInstruction()).toList(),
      summary: summary,
      isFavourite: isFavourite,
    );
  }
}

extension NutritionEntityMapper on NutrientEntity {
  Nutrition toNutrition() {
    return Nutrition(
      name: name,
      amount: amount,
      unitName: unit,
    );
  }
}

extension ExtendedIngredientEntityMapper on ExtendedIngredientEntity {
  Ingredient toIngredient() {
    return Ingredient(
      name: name,
      image: image,
      amount: amount,
      unitName: unit,
    );
  }
}

extension StepIngredientEntityMapper on StepIngredientEntity {
  Ingredient toIngredient() {
    return Ingredient(
      name: name,
      image: image,
      amount: 0.0,
      unitName: "",
    );
  }
}

extension AnalyzedInstructionEntityMapper on AnalyzedInstructionEntity {
  AnalyzedInstruction toAnalyzedInstruction() {
    return AnalyzedInstruction(
      name: name,
      steps: steps.map((e) => e.toInstructionStep()).toList(),
    );
  }
}

extension StepEntityMapper on StepEntity {
  InstructionStep toInstructionStep() {
    return InstructionStep(
      number: number,
      step: step,
      ingredients: ingredients.map((e) => e.toIngredient()).toList(),
    );
  }
}

extension RecipeDetailMapper on RecipeDetail {
  RecipeDetailEntity toEntity() {
    return RecipeDetailEntity(
      id: id,
      image: image,
      title: name,
      readyInMinutes: int.parse(takingTime),
      aggregateLikes: int.parse(likeCount),
      healthScore: double.parse(healthScore),
      extendedIngredients:
          ingredients.map((e) => e.toExtendedIngredientEntity()).toList(),
      nutrition: NutritionEntity(
          nutrients: nutrition.map((e) => e.toEntity()).toList()),
      summary: summary,
      instructions: instructions,
      analyzedInstructions: instructionSteps.map((e) => e.toEntity()).toList(),
      isFavourite: isFavourite,
    );
  }
}

extension IngredientMapper on Ingredient {
  ExtendedIngredientEntity toExtendedIngredientEntity() {
    return ExtendedIngredientEntity(
      id: 0,
      image: image,
      name: name,
      nameClean: name,
      amount: amount,
      unit: unitName,
    );
  }

  StepIngredientEntity toStepIngredientEntity() {
    return StepIngredientEntity(
      id: 0,
      name: name,
      localizedName: name,
      image: image,
    );
  }
}

extension NutritionMapper on Nutrition {
  NutrientEntity toEntity() {
    return NutrientEntity(
      name: name,
      amount: amount,
      unit: unitName,
      percentOfDailyNeeds: 0,
    );
  }
}

extension AnalyzedInstructionMapper on AnalyzedInstruction {
  AnalyzedInstructionEntity toEntity() {
    return AnalyzedInstructionEntity(
      name: name,
      steps: steps.map((e) => e.toEntity()).toList(),
    );
  }
}

extension InstructionStepMapper on InstructionStep {
  StepEntity toEntity() {
    return StepEntity(
      number: number,
      step: step,
      ingredients: ingredients.map((e) => e.toStepIngredientEntity()).toList(),
    );
  }
}

extension RecipeDetailResponseMappper on rds.RecipeDetailResponse {
  RecipeDetail toRecipeDetail() {
    return RecipeDetail(
      id: id.toString(),
      name: title ?? "",
      image: image ?? "",
      likeCount: (aggregateLikes ?? 0).toString(),
      takingTime: (readyInMinutes ?? 0).toString(),
      healthScore: healthScore.toString(),
      nutrition:
          nutrition?.nutrients?.map((e) => e.toNutrition()).toList() ?? [],
      ingredients:
          extendedIngredients?.map((e) => e.toIngredient()).toList() ?? [],
      instructions: instructions ?? "",
      instructionSteps: analyzedInstructions?.map((e) => e.toAnalyzedInstruction()).toList() ?? [],
      summary: summary ?? "",
      isFavourite: false,
    );
  }
}

extension Mapper on rds.NutrientModel {
  Nutrition toNutrition() {
    return Nutrition(
      name: name ?? "",
      amount: amount ?? 0.0,
      unitName: unit ?? "",
    );
  }
}

extension ExtendedIngredientModelMapper on rds.ExtendedIngredientModel {
  Ingredient toIngredient() {
    return Ingredient(
      name: name ?? "",
      image: image ?? "",
      amount: amount ?? 0.0,
      unitName: unit ?? "",
    );
  }
}

extension AnalyzedInstructionModelMapper on rds.AnalyzedInstructionModel {
  AnalyzedInstruction toAnalyzedInstruction() {
    return AnalyzedInstruction(
      name: name ?? "",
      steps: steps?.map((e) => e.toInstructionStep()).toList() ?? [],
    );
  }
}

extension StepModelMapper on rds.StepModel {
  InstructionStep toInstructionStep() {
    return InstructionStep(
      number: number ?? 0,
      step: step ?? "",
      ingredients: ingredients?.map((e) => e.toIngredient()).toList() ?? [],
    );
  }
}

extension StepIngredientMapper on rds.StepIngredient {
  Ingredient toIngredient() {
    return Ingredient(
      name: name ?? "",
      image: image ?? "",
      amount: 0.0,
      unitName: "",
    );
  }
}
