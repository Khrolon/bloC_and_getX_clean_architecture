import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:poc/infrastructure/navigation/bindings/main_binding.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
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
