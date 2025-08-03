import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';
import '../../../data/image_path.dart';
import '../controllers/album_selection_controller.dart';

class CustomGriedViewAlbum extends GetView<AlbumSelectionController> {
  final String albumId;

  const CustomGriedViewAlbum({super.key, required this.albumId});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImagePath.rectangle,
              height: MediaQuery.of(context).size.height * .16,
              width: MediaQuery.of(context).size.width * .35,
            ),
            Text(
              'Album Name Here',
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium16.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
            Row(
              children: [
                Text(
                  'Artist Name',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular12.copyWith(
                    color: AppColors.greyTextColor,
                  ),
                ),
                const Spacer(),
                Obx(
                      () => GestureDetector(
                    onTap: () => controller.toggleSelection(albumId),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue, // Border color
                          width: 1,
                        ),
                      ),
                      child: controller.isSelected(albumId)
                          ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                            Colors.blue, // Filled color when selected
                          ),
                        ),
                      )
                          : null,
                    ),
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