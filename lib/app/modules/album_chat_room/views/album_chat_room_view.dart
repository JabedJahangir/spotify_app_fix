import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/album_chat_room/views/chat_rooms_tab.dart';
import 'package:tanit_tanit_app/app/modules/album_chat_room/views/songs_tab.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../controllers/album_chat_room_controller.dart';

class AlbumChatRoomView extends GetView<AlbumChatRoomController> {
  const AlbumChatRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.darkBlue,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            title: "Chatroom Name",
            backGroundColor: AppColors.darkBlue,
            titleColor: AppColors.white,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AlbumChatRoomPlayer(),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        TabBar(
                          labelColor: AppColors.black,
                          unselectedLabelColor: AppColors.white,
                          isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 26,
                          ),
                          indicator: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(45),
                          ),
                          indicatorPadding: EdgeInsetsGeometry.symmetric(
                            vertical: 0,
                            horizontal: -24,
                          ),
                          dividerColor: Colors.transparent,
                          tabAlignment: TabAlignment.start,
                          tabs: [
                            Text('Songs', style: AppTextStyles.light14),
                            Text('Chatroom', style: AppTextStyles.light14),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.SUB_CHAT_ROOM);
                          },
                          child: Container(
                            height: 42,
                            width: 120,
                            decoration: BoxDecoration(
                              color: AppColors.shadeBlue,
                              borderRadius: BorderRadius.circular(45),
                            ),
                            child: Center(
                              child: Text(
                                '+ SubRoom',
                                style: AppTextStyles.light14.copyWith(
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
                        children: [SongsTab(), ChatRoomsTab()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumChatRoomPlayer extends StatelessWidget {
  const AlbumChatRoomPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*.19,
                  height: MediaQuery.of(context).size.height*.1,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImagePath.rectangle),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Song name here',
                      style: AppTextStyles.medium20,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      'Album Name here',
                      style: AppTextStyles.light16,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width *
                          .54,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_previous_outlined,
                              size: MediaQuery.of(context).size.width*.1,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.pause_outlined,
                              size: MediaQuery.of(context).size.width*.1,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_next_outlined,
                              size: MediaQuery.of(context).size.width*.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  child: Icon(Icons.heart_broken_outlined),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                width: double.infinity,
                height: 6,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Container(
                      width: 121,
                      height: 6,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.88, 0.50),
                          end: Alignment(0.38, 0.50),
                          colors: [
                            const Color(0xFFB359FF),
                            const Color(0x66D8AAFF),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1:50',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '5:56',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
