import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/journal_controller.dart';

class JournalBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<JournalController>(() => JournalController());
  }
}