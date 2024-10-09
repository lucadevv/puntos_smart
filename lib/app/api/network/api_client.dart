import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/api/services_token/token_storage_services.dart';

class ApiClient {
  final Dio _dio;
  final String baseUrl;
  final TokenStorageServices _tokenStorageService;

  ApiClient({
    required this.baseUrl,
    required TokenStorageServices tokenStorageService,
  })  : _tokenStorageService = tokenStorageService,
        _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
        )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _tokenStorageService.getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        options.headers['Accept'] = 'application/json';
        options.headers['Content-Type'] = 'application/json';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint('Response: ${response.statusCode}');
        return handler.next(response);
      },
      onError: (error, handler) {
        debugPrint('Error: ${error.message}');
        return handler.next(error);
      },
    ));
  }
  void updateBaseUrl(String newBaseUrl) {
    _dio.options.baseUrl = newBaseUrl;
  }

  // Método GET
  Future<Response> getData(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(
      path,
      queryParameters: queryParameters,
    );
  }

  // Método POST
  Future<Response> postData(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    return await _dio.post(
      path,
      data: data,
    );
  }
}
