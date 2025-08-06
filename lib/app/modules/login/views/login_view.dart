import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/home/views/home_view.dart';
import 'package:tanit_tanit_app/app/modules/login_in_input/views/login_in_input_view.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImagePath.mumuLogo, height: 90.h, width: 95.w),
                    SizedBox(height: 50.h),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN_IN_INPUT);
                      },
                      child: Text(
                        'Log In With Email',
                        style: AppTextStyles.regular16,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkBlue,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.white),
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.white,
                            child: Image.asset(
                              ImagePath.googleIcon,
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Login In With Google',
                            style: AppTextStyles.regular16.copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: AppTextStyles.regular12.copyWith(color: AppColors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.USER_SIGN_UP);
                          },
                          child: Text(
                            'Sign Up',
                            style: AppTextStyles.regular12.copyWith(
                              color: AppColors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.white,
                              decorationThickness: 1.1.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
