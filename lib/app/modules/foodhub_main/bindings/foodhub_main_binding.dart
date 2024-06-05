import 'package:get/get.dart';

import '../controllers/foodhub_main_controller.dart';

class FoodhubMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodhubMainController>(
      () => FoodhubMainController(),
    );
  }
}
