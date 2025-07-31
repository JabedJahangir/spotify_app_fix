import 'package:get/get.dart';

import '../controllers/user_sign_up_controller.dart';

class UserSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSignUpController>(
      () => UserSignUpController(),
    );
  }
}
