import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:vakinha_burguer/app/core/config/env/env.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.i['backend_base_url'] ?? '',
          connectTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
        )) {
    interceptors.add(LogInterceptor(
        requestBody: true, responseBody: true, requestHeader: true));
  }

  CustomDio auth() {
    return this;
  }

  CustomDio unauth() {
    return this;
  }
}
