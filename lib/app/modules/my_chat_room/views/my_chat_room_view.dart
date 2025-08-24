import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/modules/my_chat_room/widget/chat_list.dart';
import 'package:tanit_tanit_app/app/modules/widget/elevated_button_widget.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';
import '../controllers/my_chat_room_controller.dart';

class MyChatRoomView extends GetView<MyChatRoomController> {
  const MyChatRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.refreshChatRooms();
    });
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundWhite,
        title: Text(
          'Your Chatrooms',
          style: AppTextStyles.medium24.copyWith(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.black),
            onPressed: () {
              controller.refreshChatRooms();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.darkBlue),
          );
        }

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Obx(() {
                  final selected = controller.selectedIndex.value;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButtonWidget(
                        onPressed: () {
                          controller.valueSelected(0);
                        },
                        text: 'Chatrooms',
                        fontSize: 14,
                        height: 34,
                        width: MediaQuery.of(context).size.width * 0.29,
                        textColor: selected == 0
                            ? AppColors.white
                            : AppColors.black,
                        backgroundColor: selected == 0
                            ? AppColors.darkBlue
                            : AppColors.white,
                      ),
                      const SizedBox(width: 14),
                      ElevatedButtonWidget(
                        onPressed: () {
                          controller.valueSelected(1);
                        },
                        text: 'Subrooms',
                        fontSize: 14,
                        height: 34,
                        width: 103,
                        textColor: selected == 1
                            ? AppColors.white
                            : AppColors.black,
                        backgroundColor: selected == 1
                            ? AppColors.darkBlue
                            : AppColors.white,
                      ),
                    ],
                  );
                }),
              ),
            ),
            Obx(() {
              final selectedIndex = controller.selectedIndex.value;
              if (selectedIndex == 0) {
                // Chatrooms tab
                final chatRooms = controller.userChatRooms;

                if (chatRooms.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 48,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No chatrooms yet',
                              style: AppTextStyles.regular16.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Start chatting in an album to see it here',
                              style: AppTextStyles.light12.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return SliverList.builder(
                  itemCount: chatRooms.length + 1, // +1 for the button
                  itemBuilder: (context, index) {
                    if (index == chatRooms.length) {
                      return ElevatedButtonMethod;
                    } else {
                      final chatRoom = chatRooms[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.ALBUM_CHAT_ROOM,
                            arguments: {
                              "artistId": chatRoom['artistId'],
                              "albumId": chatRoom['albumId'],
                              "artistName": chatRoom['artistName'],
                              "image": chatRoom['imageUrl'],
                              "albumName": chatRoom['albumName'],
                            },
                          );
                        },
                        child: ChatList(
                          albumName: chatRoom['albumName'] ?? 'Unknown Album',
                          artistName:
                              chatRoom['artistName'] ?? 'Unknown Artist',
                          imageUrl: chatRoom['imageUrl'] ?? '',
                          latestMessage: chatRoom['latestMessage'] ?? '',
                          latestSenderName: chatRoom['latestSenderName'] ?? '',
                        ),
                      );
                    }
                  },
                );
              } else {
                // Subrooms tab
                final subRooms = controller.userSubRooms;

                if (subRooms.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.meeting_room_outlined,
                              size: 48,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No subrooms yet',
                              style: AppTextStyles.regular16.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Join or create a subroom to see it here',
                              style: AppTextStyles.light12.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return SliverList.builder(
                  itemCount: subRooms.length + 1, // +1 for the button
                  itemBuilder: (context, index) {
                    if (index == subRooms.length) {
                      return ElevatedButtonMethod;
                    } else {
                      final subRoom = subRooms[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.SUB_CHAT_ROOM,
                            arguments: {
                              "albumId": subRoom['albumId'],
                              "subRoomId": subRoom['subRoomId'],
                              "subRoomName": subRoom['subRoomName'],
                              "albumName": subRoom['albumName'],
                              "artistName": subRoom['artistName'],
                              "imageUrl": subRoom['imageUrl'],
                            },
                          );
                        },
                        child: ChatList(
                          albumName: subRoom['subRoomName'] ?? 'Subroom',
                          artistName: subRoom['albumName'] ?? 'Unknown Album',
                          imageUrl: subRoom['imageUrl'] ?? '',
                          latestMessage: subRoom['latestMessage'] ?? '',
                          latestSenderName: subRoom['latestSenderName'] ?? '',
                        ),
                      );
                    }
                  },
                );
              }
            }),
          ],
        );
      }),
    );
  }

  Padding get ElevatedButtonMethod {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ElevatedButtonWidget(
        prefixIcon: Icon(Icons.add, color: AppColors.white, size: 20),
        text: 'Create a Subroom',
        onPressed: () {
          Get.toNamed(Routes.SUB_CHAT_ROOM);
        },
        backgroundColor: AppColors.darkBlue,
        fontSize: 16,
        textColor: AppColors.white,
        height: 56,
        width: double.infinity,
        fontWeight: FontWeight.w400,
        borderRadius: BorderRadius.circular(120),
      ),
    );
  }
}
