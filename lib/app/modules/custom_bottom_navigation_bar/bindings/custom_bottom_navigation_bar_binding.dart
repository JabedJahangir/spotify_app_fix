import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/modules/album/controllers/album_controller.dart';
import 'package:tanit_tanit_app/app/modules/home/controllers/home_controller.dart';
import 'package:tanit_tanit_app/app/modules/profile/controllers/profile_controller.dart';

import '../../my_chat_room/controllers/my_chat_room_controller.dart';
import '../controllers/custom_bottom_navigation_bar_controller.dart';

class CustomBottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomBottomNavigationBarController>(
      () => CustomBottomNavigationBarController(),
    );
    Get.put(MyChatRoomController());
    Get.put(HomeController());
    Get.put(ProfileController());
    Get.put(AlbumController());
    Get.put(SearchController());
  }

}
