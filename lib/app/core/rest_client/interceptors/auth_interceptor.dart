import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakinha_burguer/app/core/exceptions/experie_token_exceptions.dart';

import 'package:vakinha_burguer/app/core/global/global_context.dart';

import '../custom_dio.dart';

class AuthInterceptor extends Interceptor {
  CustomDio _dio;
  AuthInterceptor({
    required CustomDio dio,
  }) : _dio = dio;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString('accessToken');
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        if (err.requestOptions.path != '/auth/refresh') {
          await _refreshToken(err);
          await _retryRequest(err, handler);
        } else {
          GlobalContext.i.loginExpired();
        }
      } catch (e) {
        GlobalContext.i.loginExpired();
      }
    } else {
      handler.next(err);
    }
  }

  _refreshToken(DioError err) async {
    try {
      final sp = await SharedPreferences.getInstance();
      final refreshToken = sp.getString('refreshToken');

      if (refreshToken == null) {
        return;
      }
      final Map<String, dynamic> body = {
        'refresh_token': refreshToken,
      };
      final resultRefresh = await _dio.auth().put('/auth/refresh', data: body);

      await sp.setString('accessToken', resultRefresh.data!['access_token']);
      await sp.setString('refreshToken', resultRefresh.data!['refresh_token']);
    } on DioError catch (e, s) {
      log('Erro ao realizar refresh Token', error: e, stackTrace: s);
      throw ExperieTokenExceptions();
    }
  }

  Future<void> _retryRequest(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    final requestOptions = err.requestOptions;
    final result = await _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        headers: requestOptions.headers,
        method: requestOptions.method,
      ),
    );

    return handler.resolve(
      Response(
        requestOptions: requestOptions,
        data: result.data,
        statusCode: result.statusCode,
        statusMessage: result.statusMessage,
      ),
    );
  }
}
