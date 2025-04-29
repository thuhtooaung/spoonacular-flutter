import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:spoonacular/utils/utils.dart';

import '../../data/models/remote/base_response_model.dart';

class BaseApiService {
  final Dio dio;

  BaseApiService({required this.dio});

  /// GET Request
  Future<T> getServerCall<T extends BaseResponseModel>(
    T obj,
    String url, {
    bool useHeaderToken = false,
    String? headerToken,
    Map<String, dynamic>? queryParameters = const {},
    Map<String, dynamic>? body = const {},
  }) async {
    try {
      var dir = await Utils().getTempDir();
      var cacheStore = HiveCacheStore(
        dir,
        hiveBoxName: "recipe_cache_box",
      );
      var customCacheOptions = CacheOptions(
        store: cacheStore,
        policy: CachePolicy.forceCache,
        priority: CachePriority.high,
        maxStale: const Duration(minutes: 30),
        hitCacheOnErrorExcept: [401, 404],
        keyBuilder: (request) {
          return request.uri.toString();
        },
        allowPostMethod: false,
      );
      dio.interceptors.add(DioCacheInterceptor(options: customCacheOptions));
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
        data: body,
      );
      if (response.data is List) {
        return obj.fromJsonList(response.data);
      }
      return obj.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

}