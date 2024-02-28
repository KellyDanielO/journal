import 'package:get/get.dart';

import '../controllers/utils_controller.dart';

class UtilsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UtitlityController>(() => UtitlityController());
  }
}
