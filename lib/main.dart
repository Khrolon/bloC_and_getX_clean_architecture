import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poc/infrastructure/inject/inject.dart';
import 'package:poc/infrastructure/routes/routes.dart';


void main() async {
  //NOTE: Inicilaiza o getIt
  Inject.init();

  //NOTE: Inicializa os comando flutter.
  WidgetsFlutterBinding.ensureInitialized();

  //NOTE: Inicializa o storage local.
  await GetStorage.init();

  // var initialRoute = await Routes.initialRoute;
  runApp(Main());
}

class Main extends StatelessWidget {
  // final String initialRoute;
  // Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.getRoutes(),
      initialRoute: AppRoutes.getInitialRoute(),
    );
  }
}
