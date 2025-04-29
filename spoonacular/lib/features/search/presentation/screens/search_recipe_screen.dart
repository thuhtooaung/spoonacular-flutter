import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/core.dart';
import '../../../widgets/recipe_item.dart';
import '../providers/search_recipe_provider.dart';

class SearchRecipeScreen extends ConsumerStatefulWidget {
  const SearchRecipeScreen({super.key});

  @override
  ConsumerState createState() => _SearchRecipeScreenState();
}

class _SearchRecipeScreenState extends ConsumerState<SearchRecipeScreen> {
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchRecipeState = ref.watch(searchRecipeProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          decoration: InputDecoration(
            hintText: "Search by ingredients(eg. banana, milk)",
            border: InputBorder.none,
          ),
          autofocus: true,
          maxLines: 1,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(searchRecipeProvider.notifier)
                  .searchRecipe(_editingController.text);
            },
            icon: Icon(Icons.search),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: switch (searchRecipeState.status) {
        SearchRecipeStatus.success => ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              var item = searchRecipeState.recipes[index];
              return RecipeItem(item: item);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.0);
            },
            itemCount: searchRecipeState.recipes.length,
          ),
        SearchRecipeStatus.error => Text(
          "Recipe Not Found!",
          style: context.appFonts.bodyMedium(),
        ),
        SearchRecipeStatus.initial => const SizedBox.shrink(),
        SearchRecipeStatus.loading => Center(child: CircularProgressIndicator()),
      },
    );
  }
}
