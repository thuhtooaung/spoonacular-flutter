import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/core/app_fonts.dart';

import '../../../detail/domain/entities/recipe_detail.dart';

class MealPlanRecipes extends StatelessWidget {
  const MealPlanRecipes({
    super.key,
    required this.recipes,
    required this.onTap,
  });

  final List<RecipeDetail> recipes;
  final Function(RecipeDetail) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final entity = recipes[index];
              return InkWell(
                onTap: () {
                  onTap(entity);
                },
                child: Container(
                  width: 200.0,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    spacing: 8.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: entity.image,
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          entity.name,
                          style: context.appFonts.titleSmall(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 8.0,
              );
            },
            itemCount: recipes.length,
          ),
        ),
      ],
    );
  }
}
