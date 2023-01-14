import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poc/presentation/login/bloc/login_bloc.dart';
import 'package:poc/presentation/login/login.screen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => BlocProvider<LoginBloc>(
          create: (_) => GetIt.instance(),
          child: LoginScreen(bloc: GetIt.instance()),
        ),
    // '/second': (BuildContext context) => SecondPage(),
  };

  static String initialRoute = '/';

  static Map<String, WidgetBuilder> getRoutes() {
    return routes;
  }

  static String getInitialRoute() {
    return initialRoute;
  }
}
