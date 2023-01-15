// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poc/domain/entities/user_entity.dart';
import 'package:poc/presentation/home/bloc/home_event.dart';
import 'package:poc/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserEntity userModel;
  HomeBloc({required this.userModel, required HomeState initialState})
      : super(initialState);
}
