import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../detail/domain/entities/recipe_detail.dart';
import '../../../home/domain/entities/recipe.dart';
import '../../../widgets/recipe_item.dart';
import '../providers/choose_saved_recipe_provider.dart';

@RoutePage()
class ChooseSavedRecipeScreen extends ConsumerStatefulWidget {
  const ChooseSavedRecipeScreen(this.ids, this.onChoose, {super.key});

  final List<String> ids;
  final Function(List<RecipeDetail>) onChoose;

  @override
  ConsumerState<ChooseSavedRecipeScreen> createState() =>
      _ChooseSavedRecipeScreenState();
}

class _ChooseSavedRecipeScreenState
    extends ConsumerState<ChooseSavedRecipeScreen> {
  late List<String> selectedIds;

  @override
  void initState() {
    super.initState();
    selectedIds = [...widget.ids];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(chooseSavedRecipeProvider.notifier).loadAllRecipes();
    });
  }

  void onSelectRecipe(RecipeDetail entity) {
    setState(() {
      if (selectedIds.contains(entity.id)) {
        selectedIds.remove(entity.id);
      } else {
        selectedIds.add(entity.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipeState = ref.watch(chooseSavedRecipeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Recipe"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final items = selectedIds
                  .map(
                    (e) => recipeState.recipes.firstWhere((f) => f.id == e),
                  )
                  .toList();
              widget.onChoose(items);
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final recipe = recipeState.recipes[index];
          return Stack(
            alignment: Alignment.topRight,
            children: [
              RecipeItem(
                item: Recipe(
                  id: recipe.id,
                  name: recipe.name,
                  image: recipe.image,
                  likeCount: recipe.likeCount,
                  timeTaken: recipe.takingTime,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Checkbox(
                    value: selectedIds.contains(recipe.id),
                    onChanged: (value) {
                      onSelectRecipe(recipe);
                    },
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
        itemCount: recipeState.recipes.length,
      ),
    );
  }
}
