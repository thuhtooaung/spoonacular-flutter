import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/datasources/remote/home_recipe_remote_datasource.dart';
import '../data/datasources/remote/home_recipe_remote_datasource_impl.dart';
import 'home_service_providers.dart';

final homeRecipeRemoteDataSource = Provider<HomeRecipeRemoteDataSource>((ref){
  return HomeRecipeRemoteDataSourceImpl(
    ref.read(homeRecipeApiService),
  );
});