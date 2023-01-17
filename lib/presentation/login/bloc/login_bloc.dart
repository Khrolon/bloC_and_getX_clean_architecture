// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poc/data/models/user_model.dart';
import 'package:poc/domain/entities/user_entity.dart';
import 'package:poc/domain/usecases/get_token_user_login_use_cases.dart';
import 'package:poc/domain/usecases/google_login_use_case.dart';
import 'package:poc/domain/usecases/user_login_use_cases.dart';
import 'package:poc/presentation/login/bloc/login_event.dart';
import 'package:poc/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IGetTokenUserLoginUseCase getTokenUserLoginUseCase;
  final IUserLoginUseCase userLoginUseCase;
  final IGoogleLoginUseCase googleLoginUseCase;
  LoginBloc({
    required this.getTokenUserLoginUseCase,
    required this.userLoginUseCase,
    required this.googleLoginUseCase,
  }) : super(LoginStateAuthPending()) {
    on<LoginEventGetToken>(_mapLoginEventGetTokenToState);
    on<LoginEventGetUser>(_mapLoginEventGetUserToState);
    on<LoginEventForgothPassword>(_mapLoginEventForgothPasswordToState);
    on<LoginEventCreateUser>(_mapLoginEventCreateUserToState);
    on<LoginEventGoogleLogin>(_mapLoginEventGoogleLoginToState);
  }
  UserEntity? userModel;
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
      (r) {
        userModel = r;
        return emit(LoginCompleteGoToSecondPage());
      },
    );
  }

  void _mapLoginEventForgothPasswordToState(
      LoginEventForgothPassword event, Emitter<LoginState> emit) {
    print('clicou em esqueceu senha');
  }

  void _mapLoginEventCreateUserToState(
      LoginEventCreateUser event, Emitter<LoginState> emit) {
    print('clicou em criar usuario');
  }

  void _mapLoginEventGoogleLoginToState(
      LoginEventGoogleLogin event, Emitter<LoginState> emit) async {
    emit(LoginStateLoading());
    var result = await googleLoginUseCase();
    result.fold(
      (l) => emit(LoginStateError('Login erro')),
      (r) => add(LoginEventGetUser()),
    );
  }
}
