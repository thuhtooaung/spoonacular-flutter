import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/services/remote/dio/dio_provider.dart';
import '../data/datasources/remote/recipe_detail_api_service.dart';

final recipeDetailApiService = Provider<RecipeDetailApiService>((ref){
  return RecipeDetailApiService(dio: ref.read(dioProvider));
});