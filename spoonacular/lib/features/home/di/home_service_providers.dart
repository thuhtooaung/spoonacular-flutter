import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/services/remote/dio/dio_provider.dart';
import '../data/datasources/remote/home_recipe_api_service.dart';

final homeRecipeApiService = Provider<HomeRecipeApiService>((ref){
  return HomeRecipeApiService(dio: ref.read(dioProvider));
});