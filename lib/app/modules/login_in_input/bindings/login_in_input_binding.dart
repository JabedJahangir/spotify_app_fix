import 'package:get/get.dart';

import '../controllers/login_in_input_controller.dart';

class LoginInInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginInInputController>(
      () => LoginInInputController(),
    );
  }
}
