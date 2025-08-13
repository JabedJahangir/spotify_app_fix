import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

import '../controllers/album_chat_room_controller.dart';
import '../widget/custom_chat_box_container.dart';

class ChatRoomsTab extends GetView<AlbumChatRoomController> {
  const ChatRoomsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    return Column(
      children: [
        // Message List
        Expanded(
          child: Obx(
            () => ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final isSender = index.isOdd;
                return Align(
                  alignment: index.isEven
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: index.isEven
                        ? CustomChatBoxContainer(
                            index: index,
                            isSender: isSender,
                            backGroundColor: AppColors.white,
                          )
                        : CustomChatBoxContainer(
                            index: index,
                            isSender: isSender,
                            backGroundColor: AppColors.indigo,
                      textColor: AppColors.white,
                          ),
                  ),
                );
              },
            ),
          ),
        ),

        // Message Input + Send Button
        SizedBox(
          width: double.infinity,
          height: 30.h + 30, // Add padding buffer
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                    ? 35.h
                    : 65.h,
                width: 220.w,
                child: TextField(
                  controller: controller.textController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * .03),
              GestureDetector(
                onTap: () {
                  controller.sendMessage();
                  FocusScope.of(context).unfocus(); // optional: close keyboard
                },
                child: Container(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                      ? 40.h
                      : 70.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: AppColors.blue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Send  ',
                        style: AppTextStyles.regular14.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Icon(
                        Icons.send_outlined,
                        color: AppColors.white,
                        size: 16.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
