import 'package:get/get.dart';
import 'package:poc/presentation/charts/controller/charts_controller.dart';

class ChartsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartsController>(() => ChartsController());
  }
}
