import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../controllers/start_now_controller.dart';

class StartNowView extends GetView<StartNowController> {
  const StartNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body:  SafeArea(
    child: CustomScrollView(
    slivers: [
    SliverFillRemaining(
      hasScrollBody: false,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(ImagePath.startNow, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 50.h,
              horizontal: 16.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Image.asset(
                  ImagePath.mumuLogo,
                  width: 140.w,
                  height: 130.h,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    onPressed: () {
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    child: Text(
                      'Start Now',
                      style: AppTextStyles.regular16.copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),]
    ,
    )
    ,
    )
    ,

    );
  }
}
