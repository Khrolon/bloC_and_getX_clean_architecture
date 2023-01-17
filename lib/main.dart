import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poc/infrastructure/bindings/main_binding.dart';
import 'package:poc/infrastructure/navigation/navigation.dart';
import 'package:poc/infrastructure/routes/routes.dart';

void main() async {
  var initialRoute = await AppRoutes.initialRoute;

  //NOTE: Inicializa os comando flutter.
  WidgetsFlutterBinding.ensureInitialized();

  //NOTE: Inicializa o storage local.
  await GetStorage.init();

  // var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      initialBinding: MainBinding(),
      getPages: Nav.routes,
    );
  }
}
