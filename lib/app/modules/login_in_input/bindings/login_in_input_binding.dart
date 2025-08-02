import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/modules/login/controllers/login_controller.dart';

import '../controllers/login_in_input_controller.dart';

class LoginInInputBinding extends Bindings {
  @override
  void dependencies() {
    /*Get.lazyPut<LoginInInputController>(
      () => LoginInInputController(),
    );*/
    Get.put(LoginInInputController());
  }
}
