class RecipeDetail {
  final String id;
  final String name;
  final String image;
  final String likeCount;
  final String takingTime;
  final String healthScore;
  final List<Nutrition> nutrition;
  final List<Ingredient> ingredients;
  final String instructions;
  final List<AnalyzedInstruction> instructionSteps;
  final String summary;
  bool isFavourite;

  RecipeDetail({
    required this.id,
    required this.name,
    required this.image,
    required this.likeCount,
    required this.takingTime,
    required this.healthScore,
    required this.nutrition,
    required this.ingredients,
    required this.instructions,
    required this.instructionSteps,
    required this.summary,
    required this.isFavourite,
  });
}

class Nutrition {
  final String name;
  final double amount;
  final String unitName;

  Nutrition({
    required this.name,
    required this.amount,
    required this.unitName,
  });
}

class Ingredient {
  final String name;
  final String image;
  final double amount;
  final String unitName;

  Ingredient({
    required this.name,
    required this.image,
    required this.amount,
    required this.unitName,
  });
}

class AnalyzedInstruction {
  final String name;
  final List<InstructionStep> steps;

  AnalyzedInstruction({
    required this.name,
    required this.steps,
  });
}

class InstructionStep {
  final int number;
  final String step;
  final List<Ingredient> ingredients;

  InstructionStep({
    required this.number,
    required this.step,
    required this.ingredients,
  });
}
