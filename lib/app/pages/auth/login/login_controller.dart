import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vakinha_burguer/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:vakinha_burguer/app/pages/auth/login/login_state.dart';

import '../../../repository/auth/auth_repository.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginController(this._authRepository) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      final authModel = await _authRepository.login(email, password);
      await _authRepository.setToken(
          authModel.accessToken, authModel.refreshToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedExcepetions catch (e) {
      log('Login ou senha inválidos', error: e);
      emit(state.copyWith(
          status: LoginStatus.error, errorMessage: 'Login ou Senha inválidos'));
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      emit(state.copyWith(
          status: LoginStatus.error, errorMessage: 'Erro ao realizar login'));
    }
  }
}
