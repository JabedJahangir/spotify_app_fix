import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      height: 230.h,
      width: 180.w,
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160.h,
              width: 160.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: AssetImage(ImagePath.rectangle),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Album Name Here',
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium16.copyWith(
                color: AppColors.greyTextColor,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Artist Name',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.greyTextColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () => controller.toggleSelection(albumId),
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 1.w),
                      ),
                      child: controller.isSelected(albumId)
                          ? Center(
                              child: Container(
                                width: 10.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
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
