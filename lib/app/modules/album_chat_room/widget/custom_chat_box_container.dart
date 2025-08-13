import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';
import '../../../data/image_path.dart';
import '../controllers/album_chat_room_controller.dart';

class CustomChatBoxContainer extends GetView<AlbumChatRoomController> {

  const CustomChatBoxContainer({
    super.key,
    required this.index,
    this.isSender = false,
    this.backGroundColor,
    this.textColor = AppColors.black,
  });

  final int index;
  final bool isSender;
  final Color? backGroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSender)
          CircleAvatar(backgroundImage: AssetImage(ImagePath.personImage)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            constraints: BoxConstraints(maxWidth: 230.w),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: backGroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              controller.messages[index],
              softWrap: true,
              overflow: TextOverflow.visible,
              style: AppTextStyles.regular14.copyWith(
                color: textColor,
              ),
            ),
          ),
        ),
        if (isSender)
          CircleAvatar(backgroundImage: AssetImage(ImagePath.personImage)),
        Text(
          '5:16',
          style: AppTextStyles.light8.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
