import 'package:flutter/material.dart';
import 'package:spoonacular/core/app_colors.dart';
import 'package:spoonacular/core/app_fonts.dart';

class RecipeInfo extends StatelessWidget {
  const RecipeInfo({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final color = context.appColors.primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.appFonts.bodyMedium(),
        ),
        Text(
          value,
          style: context.appFonts.bodyMedium()?.copyWith(color: color),
        ),
      ],
    );
  }
}
