import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/modules/album_chat_room/views/chat_rooms_tab.dart';
import 'package:tanit_tanit_app/app/modules/album_chat_room/views/songs_tab.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_album_chat_room_player.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../controllers/album_chat_room_controller.dart';

class AlbumChatRoomView extends GetView<AlbumChatRoomController> {
  const AlbumChatRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final artistId = args?["artistId"] ?? '';
    final albumId = args?["albumId"] ?? '';
    final imageUrl = args?["image"] ?? '';
    final albumName = args?["albumName"] ?? '';
    final artistName = args?["name"] ?? '';
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.darkBlue,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            title: albumName,
            backGroundColor: AppColors.darkBlue,
            titleColor: AppColors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAlbumChatRoomPlayer(),
              SizedBox(height: 20.h),
              Row(
                children: [
                  TabBar(
                    labelColor: AppColors.black,
                    unselectedLabelColor: AppColors.white,
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 18,
                    ),
                    indicator: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    indicatorPadding: EdgeInsetsGeometry.symmetric(
                      vertical: 0,
                      horizontal: -10,
                    ),
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      Text('Songs', style: AppTextStyles.regular14),
                      Text('Chatroom', style: AppTextStyles.regular14),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .02),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SUB_CHAT_ROOM);
                    },
                    child: Container(
                      height:
                          MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 42.h
                          : 70.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: AppColors.shadeBlue,
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Center(
                        child: Text(
                          '+ SubRoom',
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SongsTab(
                      artistId: artistId,
                      controller: controller,
                      albumId: albumId,
                      image: imageUrl,
                      artistName: artistName,
                    ),
                    ChatRoomsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
