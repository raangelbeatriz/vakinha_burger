import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakinha_burguer/app/core/exceptions/repository_exceptions.dart';
import 'package:vakinha_burguer/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:vakinha_burguer/app/core/rest_client/custom_dio.dart';
import 'package:vakinha_burguer/app/models/auth_model.dart';
import 'package:vakinha_burguer/app/repository/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio _customDio;

  AuthRepositoryImpl(this._customDio);
  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final register = await _customDio
          .unauth()
          .post('/auth', data: {'email': email, 'password': password});
      return AuthModel.fromMap(register.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 403) {
        log('Permissão negada', error: e, stackTrace: s);
        throw UnauthorizedExcepetions();
      }
      log('Erro ao realizar login', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar login');
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await _customDio.unauth().post('/users',
          data: {'name': name, 'email': email, 'password': password});
    } on DioError catch (e, s) {
      log('Erro ao registrar usuario', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar usuário');
    }
  }

  @override
  Future<String?> getAcessToken() async {
    try {
      final sp = await SharedPreferences.getInstance();
      return sp.getString('accessToken');
    } catch (e) {
      log('Erro ao acessar token', error: e);
      throw RepositoryException(message: 'Erro ao acessar token');
    }
  }

  @override
  Future<void> setToken(String accessToken, String refreshToken) async {
    try {
      final sp = await SharedPreferences.getInstance();
      await sp.setString('accessToken', accessToken);
      await sp.setString('refreshToken', refreshToken);
    } on Exception catch (e) {
      log('Erro ao acessar token', error: e);
      throw RepositoryException(message: 'Erro ao acessar token');
    }
  }
}
