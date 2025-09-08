import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../data/app_colors.dart';
import '../../data/app_text_styles.dart';
import '../../data/image_path.dart';
import '../album_chat_room/controllers/album_chat_room_controller.dart';

class CustomAlbumChatRoomPlayer extends StatelessWidget {
  const CustomAlbumChatRoomPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AlbumChatRoomController>();
    return Obx(
      () => Container(
        width: MediaQuery.of(context).orientation == Orientation.portrait
            ? double.infinity
            : 300.w,
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
                    width: 90.w,
                    height:
                        MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 90.h
                        : 200.h,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: controller.currentImageUrl.value.isNotEmpty
                            ? NetworkImage(controller.currentImageUrl.value)
                            : AssetImage(ImagePath.rectangle),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),

                  // Use Expanded to constrain text to available space
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.currentTrackName.value.isNotEmpty
                              ? controller.currentTrackName.value
                              : 'Song name here',
                          style: AppTextStyles.medium20,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          controller.currentAlbumName.value.isNotEmpty
                              ? controller.currentAlbumName.value
                              : 'Album Name here',
                          style: AppTextStyles.light16,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: controller.playPreviousTrack,
                              icon: Icon(
                                Icons.skip_previous_outlined,
                                size: MediaQuery.of(context).size.width * .1,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (controller.isPlaying.value) {
                                  controller.pauseTrack();
                                } else {
                                  controller.resumeTrack();
                                }
                              },
                              icon: Icon(
                                controller.isPlaying.value
                                    ? Icons.pause_outlined
                                    : Icons.play_arrow_outlined,
                                size: MediaQuery.of(context).size.width * .1,
                              ),
                            ),
                            IconButton(
                              onPressed: controller.playNextTrack,
                              icon: Icon(
                                Icons.skip_next_outlined,
                                size: MediaQuery.of(context).size.width * .1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(child: Icon(Icons.heart_broken_outlined)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    // Custom gradient progress bar with tap and drag support
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final progressWidth =
                            constraints.maxWidth *
                            controller.currentTrackProgress.value;
                        return GestureDetector(
                          onTapDown: (details) {
                            final tapPosition = details.localPosition.dx;
                            final positionPercentage =
                                tapPosition / constraints.maxWidth;
                            controller.seekToPosition(
                              positionPercentage.clamp(0.0, 1.0),
                            );
                          },
                          onHorizontalDragStart: (details) {
                            final dragPosition = details.localPosition.dx;
                            final positionPercentage =
                                dragPosition / constraints.maxWidth;
                            controller.seekToPosition(
                              positionPercentage.clamp(0.0, 1.0),
                            );
                          },
                          onHorizontalDragUpdate: (details) {
                            final dragPosition = details.localPosition.dx;
                            final positionPercentage =
                                dragPosition / constraints.maxWidth;
                            controller.seekToPosition(
                              positionPercentage.clamp(0.0, 1.0),
                            );
                          },
                          onHorizontalDragEnd: (details) {
                            // Optional: You can add any cleanup or feedback here
                          },
                          child: Container(
                            width: constraints.maxWidth,
                            height: 6.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Stack(
                              children: [
                                // Progress fill with gradient
                                Container(
                                  width: progressWidth,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment(0.88, 0.50),
                                      end: Alignment(0.38, 0.50),
                                      colors: [
                                        Color(0xFFB359FF),
                                        Color(0x66D8AAFF),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    // Time labels
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.currentTrackDuration.value,
                          style: AppTextStyles.medium12,
                        ),
                        Text(
                          controller.totalTrackDuration.value,
                          style: AppTextStyles.medium12,
                        ),
                      ],
                    ),
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
