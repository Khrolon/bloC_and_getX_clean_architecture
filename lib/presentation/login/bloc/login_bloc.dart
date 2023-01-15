import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/domain/usecases/get_token_user_login_use_cases.dart';
import 'package:poc/domain/usecases/user_login_use_cases.dart';
import 'package:poc/presentation/login/bloc/login_event.dart';
import 'package:poc/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IGetTokenUserLoginUseCase getTokenUserLoginUseCase;
  final IUserLoginUseCase userLoginUseCase;
  LoginBloc({
    required this.userLoginUseCase,
    required this.getTokenUserLoginUseCase,
  }) : super(LoginStateAuthPending()) {
    on<LoginEventGetToken>(_mapLoginEventGetTokenToState);
    on<LoginEventGetUser>(_mapLoginEventGetUserToState);
    on<LoginEventForgothPassword>(_mapLoginEventForgothPasswordToState);
    on<LoginEventCreateUser>(_mapLoginEventCreateUserToState);
    on<LoginEventGoogleLogin>(_mapLoginEventGoogleLoginToState);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _mapLoginEventGetTokenToState(
      LoginEventGetToken event, Emitter<LoginState> emit) async {
    emit(LoginStateLoading());
    var result = await getTokenUserLoginUseCase(event.email, event.password);
    result.fold(
      (l) => emit(
        LoginStateError('Login erro'),
      ),
      (r) => add(LoginEventGetUser()),
    );
  }

  void _mapLoginEventGetUserToState(
      LoginEventGetUser event, Emitter<LoginState> emit) async {
    var result = await userLoginUseCase();
    result.fold(
      (l) => emit(LoginStateError('Login erro')),
      (r) => emit(LoginCompleteGoToSecondPage(r)),
    );
  }

  FutureOr<void> _mapLoginEventForgothPasswordToState(
      LoginEventForgothPassword event, Emitter<LoginState> emit) {
    print('clicou em esqueceu senha');
  }

  FutureOr<void> _mapLoginEventCreateUserToState(
      LoginEventCreateUser event, Emitter<LoginState> emit) {
    print('clicou em criar usuario');
  }

  FutureOr<void> _mapLoginEventGoogleLoginToState(
      LoginEventGoogleLogin event, Emitter<LoginState> emit) {
    print('clicou em criar acessar com google');
  }
}
