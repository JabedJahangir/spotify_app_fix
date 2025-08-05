import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../controllers/platforms_link_controller.dart';

class PlatformsLinkView extends GetView<PlatformsLinkController> {
  const PlatformsLinkView({super.key});

  @override
  Widget build(BuildContext context) {
    // Make sure to initialize ScreenUtil in your app's entry point (main.dart)
    // ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 130.h),
                Text(
                  '🎵 Add Your Spotify',
                  style: AppTextStyles.bold24.copyWith(fontSize: 24.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Connect your account so we can discover the albums and artists that shape your vibe.',
                  style: AppTextStyles.regular16.copyWith(
                    color: AppColors.greyTextColor,
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h), // Reduced spacing for responsiveness
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.ALBUM_SELECTION);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backGroundBlack,
                    minimumSize: Size(double.infinity, 48.h),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImagePath.spotify, height: 32.h, width: 32.w),
                      SizedBox(width: 10.w),
                      Text(
                        'Log In with Spotify',
                        style: AppTextStyles.medium16.copyWith(
                          color: AppColors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.ALBUM_SELECTION);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backGroundBlack,
                    minimumSize: Size(double.infinity, 48.h),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImagePath.logo, height: 32.h, width: 32.w),
                      SizedBox(width: 10.w),
                      Text(
                        'Log In with Deezer',
                        style: AppTextStyles.medium16.copyWith(
                          color: AppColors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.ALBUM_SELECTION);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backGroundBlack,
                    minimumSize: Size(double.infinity, 48.h),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 18.r,
                        child: Image.asset(
                          ImagePath.apple,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Log In with Apple',
                        style: AppTextStyles.medium16.copyWith(
                          color: AppColors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
