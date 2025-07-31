import 'package:get/get.dart';

import '../controllers/all_search_controller.dart';

class AllSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllSearchController>(
      () => AllSearchController(),
    );
  }
}
