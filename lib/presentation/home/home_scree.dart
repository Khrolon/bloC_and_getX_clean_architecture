// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/presentation/home/bloc/home_bloc.dart';
import 'package:poc/presentation/home/bloc/home_event.dart';
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            bloc.add(HomeEventLogout());
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('HomeScreen'),
        centerTitle: true,
      ),
      body: BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is HomeStatePop) {
            Navigator.pop(context);
          }
        },
        child: BlocBuilder(
          bloc: bloc,
          builder: ((context, state) {
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(bloc.userModel.picture),
                    ),
                    SizedBox(height: 12),
                    Text(
                      bloc.userModel.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(bloc.userModel.email),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
