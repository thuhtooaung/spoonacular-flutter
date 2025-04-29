import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular/features/search/di/search_service_providers.dart';

import '../data/datasources/remote/search_recipes_remote_datasource.dart';
import '../data/datasources/remote/search_recipes_remote_datasource_impl.dart';

final searchRecipesRemoteDataSource = Provider<SearchRecipesRemoteDataSource>((ref){
  return SearchRecipesRemoteDataSourceImpl(
    ref.read(searchRecipesApiService),
  );
});