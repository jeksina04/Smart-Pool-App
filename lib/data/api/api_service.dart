import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_constants.dart';
import '../storage/storage.dart';

class ApiService {
  late dio.Dio _dio;

  ApiService() {
    _dio = dio.Dio(dio.BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: 120000),
        receiveTimeout: const Duration(milliseconds: 120000)));

    /**
     * set auth token if it exists in local
     */
    setAuthToken(GetIt.I.get<StorageService>().authToken);

    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<dio.Response<T>> get<T>(
          {required String url,
          Map<String, dynamic>? queryParams,
          bool isCompleteUrl = false}) =>
      isCompleteUrl
          ? _dio.getUri(Uri(path: url, queryParameters: queryParams))
          : _dio.get(url, queryParameters: queryParams);

  /// pass FormData.fromMap() as data in case of form data type
  Future<dio.Response<T>> post<T>(
          {required String url,
          data,
          Map<String, dynamic>? queryParams,
          bool isCompleteUrl = false}) =>
      isCompleteUrl
          ? _dio.postUri(Uri(path: url, queryParameters: queryParams),
              data: data,
              options: data is FormData
                  ? dio.Options(
                      contentType: dio.Headers.formUrlEncodedContentType)
                  : null)
          : _dio.post(url,
              queryParameters: queryParams,
              data: data,
              options: data is FormData
                  ? dio.Options(
                      contentType: dio.Headers.formUrlEncodedContentType)
                  : null);

  Future<dio.Response<T>> delete<T>(
          {required String url,
          data,
          Map<String, dynamic>? queryParams,
          bool isCompleteUrl = false}) =>
      isCompleteUrl
          ? _dio.deleteUri(Uri(path: url, queryParameters: queryParams),
              data: data)
          : _dio.delete(url, queryParameters: queryParams, data: data);

  Future<dio.Response<T>> patch<T>(
          {required String url,
          data,
          Map<String, dynamic>? queryParams,
          bool isCompleteUrl = false}) =>
      isCompleteUrl
          ? _dio.patchUri(Uri(path: url, queryParameters: queryParams),
              data: data)
          : _dio.patch(url, queryParameters: queryParams, data: data);

  setAuthToken(String token) {
    if (token.isNotEmpty) {
      _dio.options.headers.addAll({"Authorization": "Bearer $token"});
    }
  }
}
