import 'package:get/get.dart';

import '../controllers/sub_chat_room_controller.dart';

class SubChatRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubChatRoomController>(
      () => SubChatRoomController(),
    );
  }
}
