import 'package:get/get.dart';

import '../../presentation/other_charts/controller/other_charts_controller.dart';

class OtherChartsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherChartsController>(() => OtherChartsController());
  }
}
