import 'package:get/get.dart';

import '../controllers/start_now_controller.dart';

class StartNowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartNowController>(
      () => StartNowController(),
    );
  }
}
