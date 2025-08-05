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
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundWhite,
        title: Text(
          'Your Chatrooms',
          style: AppTextStyles.medium24.copyWith(color: Colors.black),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                      fontSize: 16,
                      height: 34,
                      width: 103,
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
                      fontSize: 16,
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
              return SliverList.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  if (index == 14) {
                    return Column(
                      children: [
                        SizedBox(width: double.infinity, child: InkWell(
                            onTap: (){
                              Get.toNamed(Routes.ALBUM_CHAT_ROOM);
                            },
                            child: ChatList())),
                        ElevatedButtonMethod,
                      ],
                    );
                  } else {
                    return InkWell(
                        onTap:(){
                          Get.toNamed(Routes.ALBUM_CHAT_ROOM);
                        },
                        child: ChatList());
                  }
                },
              );
            } else {
              return SliverList.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  if (index == 4) {
                    return Column(
                      children: [
                        SizedBox(width: double.infinity, child: InkWell(
                          onTap: (){
                            Get.toNamed(Routes.ALBUM_CHAT_ROOM);
                          },
                            child: ChatList())),
                        ElevatedButtonMethod,
                      ],
                    );
                  } else {
                    return InkWell(
                        onTap: (){
                          Get.toNamed(Routes.ALBUM_CHAT_ROOM);
                        },
                        child: ChatList());
                  }
                },
              );
            }
          }),
        ],
      ),
    );
  }

  Padding get ElevatedButtonMethod {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
