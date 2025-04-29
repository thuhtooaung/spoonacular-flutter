import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/core/app_fonts.dart';

import '../../routes/app_route.dart';
import '../home/domain/entities/recipe.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.item,
  });

  final Recipe item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(RecipeDetailRoute(id: item.id));
      },
      child: Card(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: item.image,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: context.appFonts.titleSmall(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 8.0,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.thumb_up),
                          Text(
                            item.likeCount,
                            style: context.appFonts.bodyMedium(),
                          )
                        ],
                      ),
                      Row(
                        spacing: 8.0,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            item.timeTaken,
                            style: context.appFonts.bodyMedium(),
                          ),
                          Icon(Icons.lock_clock),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
