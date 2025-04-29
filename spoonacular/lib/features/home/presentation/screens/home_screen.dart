import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../search/presentation/screens/search_recipe_screen.dart';
import '../../../widgets/recipe_item.dart';
import '../providers/home_provider.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).initHomeRecipe();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spoonacular"),
        actions: [
          IconButton(
            onPressed: () {
              context.router.pushWidget(const SearchRecipeScreen());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          const HomeBodyWidget(),
        ],
      ),
    );
  }
}

class HomeBodyWidget extends ConsumerWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeState = ref.watch(homeProvider);
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: homeState.status == HomeProviderStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    padding: EdgeInsets.all(16.0),
                    itemCount: homeState.recipes.length,
                    itemBuilder: (context, index) {
                      var item = homeState.recipes[index];
                      return RecipeItem(item: item);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16.0);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
