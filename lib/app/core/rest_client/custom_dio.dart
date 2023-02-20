import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:vakinha_burguer/app/core/config/env/env.dart';
import 'package:vakinha_burguer/app/core/rest_client/interceptors/auth_interceptor.dart';

class CustomDio extends DioForNative {
  late AuthInterceptor _authInterceptor;
  CustomDio()
      : super(
          BaseOptions(
            baseUrl: Env.i['backend_base_url'] ?? '',
            connectTimeout: const Duration(seconds: 50),
            receiveTimeout: const Duration(seconds: 50),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
          requestBody: true, responseBody: true, requestHeader: true),
    );
    _authInterceptor = AuthInterceptor();
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
