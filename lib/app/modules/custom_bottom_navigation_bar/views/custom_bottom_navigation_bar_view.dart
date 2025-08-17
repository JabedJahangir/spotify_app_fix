import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/album/views/album_view.dart';
import 'package:tanit_tanit_app/app/modules/my_chat_room/views/my_chat_room_view.dart';
import 'package:tanit_tanit_app/app/modules/profile/views/profile_view.dart';
import 'package:tanit_tanit_app/app/modules/search/views/search_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/custom_bottom_navigation_bar_controller.dart';

class CustomBottomNavigationBarView
    extends GetView<CustomBottomNavigationBarController> {
  CustomBottomNavigationBarView({super.key});

  final List _pages = [
    HomeView(),
    MyChatRoomView(),
    ProfileView(),
    AlbumView(),
    SearchView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: _pages[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          backgroundColor: Color(0xFFF9F9F9).withOpacity(0.9),
          selectedItemColor: AppColors.darkBlue,
          unselectedItemColor: AppColors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            _buildItem(0, ImagePath.house, 'Home'),
            _buildItem(1, ImagePath.messageText, 'My Chatrooms'),
            _buildItem(2, ImagePath.user, 'Profile'),
            _buildItem(3, ImagePath.music, 'Albums'),
            _buildItem(4, ImagePath.searchNormal, 'Search'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(int index, String iconPath, String label) {
    final isSelected = controller.currentIndex.value == index;
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        height: 25.h,
        width: 28.w,
        color: isSelected ? AppColors.darkBlue : AppColors.grey,
      ),
      label: label,
    );
  }
}
