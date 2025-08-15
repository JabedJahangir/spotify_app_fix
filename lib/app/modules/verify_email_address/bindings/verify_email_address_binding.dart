import 'package:get/get.dart';

import '../controllers/verify_email_address_controller.dart';

class VerifyEmailAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyEmailAddressController>(
      () => VerifyEmailAddressController(),
    );
  }
}
