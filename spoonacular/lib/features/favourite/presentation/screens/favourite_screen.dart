import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/recipe_item.dart';
import '../providers/favourite_provider.dart';

@RoutePage()
class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favouriteProvider.notifier).getFavouriteRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    var favouriteState = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Favourites")),
      body: ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemCount: favouriteState.recipes.length,
        itemBuilder: (context, index) {
          var item = favouriteState.recipes[index];
          return RecipeItem(item: item);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.0);
        },
      ),
    );
  }
}
