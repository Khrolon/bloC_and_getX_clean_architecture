// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poc/presentation/home/bloc/home_bloc.dart';
import 'package:poc/presentation/home/bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  final HomeBloc bloc;
  const HomeScreen({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: bloc,
        builder: ((context, state) {
          return Container(
            child: Center(
              child: Text(bloc.userModel.name),
            ),
          );
        }),
      ),
    );
  }
}
