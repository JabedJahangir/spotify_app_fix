import 'package:get/get.dart';

import '../controllers/album_chat_room_controller.dart';

class AlbumChatRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlbumChatRoomController>(
      () => AlbumChatRoomController(),
    );
  }
}
