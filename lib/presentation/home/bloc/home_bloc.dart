// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poc/domain/entities/user_entity.dart';
import 'package:poc/domain/usecases/user_google_logout.dart';
import 'package:poc/presentation/home/bloc/home_event.dart';
import 'package:poc/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeState initialState;
  final IUserGoogleLogoutUseCase userGoogleLogout;
  final UserEntity userModel;
  HomeBloc({
    required this.initialState,
    required this.userGoogleLogout,
    required this.userModel,
  }) : super(initialState) {
    on<HomeEventLogout>(_mapHomeEventLogoutToState);
  }

  FutureOr<void> _mapHomeEventLogoutToState(
      HomeEventLogout event, Emitter<HomeState> emit) async {
    final result = await userGoogleLogout();
    result.fold(
      (l) => throw Exception(),
      (r) => emit(
        HomeStatePop(),
      ),
    );
  }
}
