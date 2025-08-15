import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';
import '../../widget/custom_app_bar.dart';
import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight.h),
        child: CustomAppBar(backGroundColor: AppColors.darkBlue),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true, // allow scrolling if content is bigger
            child: Center(
              child: SingleChildScrollView(
                // scrollable content
                child: Container(
                  width: 0.9.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.backGroundWhite,
                  ),
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New Password', style: AppTextStyles.bold20),
                      Text(
                        'Please write your new password',
                        style: AppTextStyles.regular12,
                      ),
                      SizedBox(height: 20.h),
                      Text('New Password', style: AppTextStyles.regular12),
                      SizedBox(height: 10.h),
                      TextFormField(
                          controller: controller.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters long";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: AppTextStyles.regular16.copyWith(
                              color: AppColors.greyTextColor,
                            ),
                          ),
                        ),
                      SizedBox(height: 16.h),
                      Text('Confirm Password', style: AppTextStyles.regular12),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: controller.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters long";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: AppTextStyles.regular16.copyWith(
                            color: AppColors.greyTextColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.CUSTOM_BOTTOM_NAVIGATION_BAR);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBlack,
                          ),
                          child: Text(
                            'Confirm Password',
                            style: AppTextStyles.regular16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
