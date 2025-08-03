import 'package:get/get.dart';

import '../controllers/my_chat_room_controller.dart';

class MyChatRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyChatRoomController>(
      () => MyChatRoomController(),
    );
  }
}
