import 'package:get/get.dart';

import '../controllers/platforms_link_controller.dart';

class PlatformsLinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlatformsLinkController>(
      () => PlatformsLinkController(),
    );
  }
}
