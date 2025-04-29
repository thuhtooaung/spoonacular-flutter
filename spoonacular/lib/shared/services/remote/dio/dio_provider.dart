import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services.dart';

final dioProvider = Provider<Dio>((ref) => DioProvider().init());

class DioProvider {
  Dio dio = Dio();

  Dio init() {
    if (kDebugMode) {
      final prettyDioLogger = PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        error: true,
        compact: true,
      );
      dio.interceptors.add(prettyDioLogger);
    }
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      baseUrl: ApiConst.baseUrl,
      queryParameters: {
        "apiKey" : "133f66eb07d84065b1f1bea8ae78cb1d"
      }
    );
    return dio;
  }
}
