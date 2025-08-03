import 'package:get/get.dart';

import '../../my_chat_room/controllers/my_chat_room_controller.dart';
import '../controllers/custom_bottom_navigation_bar_controller.dart';

class CustomBottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomBottomNavigationBarController>(
      () => CustomBottomNavigationBarController(),
    );
    Get.put(MyChatRoomController());

  }

}
