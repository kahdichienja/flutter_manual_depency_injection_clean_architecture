import 'package:cleanachitecture/util/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'interceptors/error_intercepter.dart';
import 'interceptors/logging_interceptor.dart';

/*
This is where dio [Http request client ] get registered and instantiated
*/
class RestClient {
  static final CacheConfig cacheConfig = CacheConfig();
  final LoggingInterceptor loggingInterceptor = LoggingInterceptor();
  
  static String _token = '';
  static get token => _token;

  static configureApi(token) async {
    _token = token;
  }

  Dio? _dio;
  Dio get dio => _dio!;
  Options get cacheOptions => _cacheOptions;

  ///The data from the api is cached for [7] days ,but auto refreshed onse the client
  //connects to the server
  Options _cacheOptions = buildCacheOptions(Duration(days: 7), maxStale: Duration(days: 10), forceRefresh: true);

  RestClient({BaseOptions? options}) {
    _dio = create(options);
  }

  ///Setting headers required by the api
  ///The [interceptors] acts as validators if an error occur
  ///they are caught by the interceptors

  Dio create([BaseOptions? options]) {
    Dio dio = Dio(options);

    dio.options.headers['Content-Type'] = 'application/json; charset=UTF-8';
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.interceptors
      ..add(ErrorInterceptor())
      ..add(DioCacheManager(cacheConfig).interceptor)
      ..add(loggingInterceptor);
    return dio;
  }
}
