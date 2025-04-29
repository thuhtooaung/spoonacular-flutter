import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/services/remote/dio/dio_provider.dart';
import '../data/datasources/remote/search_recipes_api_service.dart';

final searchRecipesApiService = Provider<SearchRecipesApiService>((ref){
  return SearchRecipesApiService(dio: ref.read(dioProvider));
});