import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../controllers/finish_controller.dart';

class FinishView extends GetView<FinishController> {
  const FinishView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(backGroundColor: AppColors.backGroundBlue),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Image.asset(ImagePath.finish, height: 170.h, width: 290.w),
                  Text(
                    'Welcome to MUMU',
                    style: AppTextStyles.bold24.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Your favorite music. Your community. Your thoughts. All in one space.',
                    style: AppTextStyles.regular16.copyWith(
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.PLATFORMS_LINK);
                    },
                    child: Text('Finish'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
