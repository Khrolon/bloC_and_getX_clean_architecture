class AppRoutes {
  static Future<String> get initialRoute async {
    return login;
  }

  static const login = '/login';
  static const home = '/home';
  static const charts = '/chart';
  static const otherCharts = '/otherCharts';

  // static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  //   '/': (BuildContext context) => BlocProvider<LoginBloc>(
  //         create: (_) => GetIt.instance(),
  //         child: LoginScreen(bloc: GetIt.instance()),
  //       ),
  //   '/home': (BuildContext context) => BlocProvider<HomeBloc>(
  //         create: (_) => GetIt.instance(),
  //         child: HomeScreen(
  //           bloc: GetIt.instance(),
  //         ),
  //       ),
  // };

  // static String initialRoute = '/';

  // static Map<String, WidgetBuilder> getRoutes() {
  //   return routes;
  // }

  // static String getInitialRoute() {
  //   return initialRoute;
  // }
}
