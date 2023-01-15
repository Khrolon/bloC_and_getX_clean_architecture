import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/presentation/home/bloc/home_event.dart';
import 'package:poc/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState);
}
