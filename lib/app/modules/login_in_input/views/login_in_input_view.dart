import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../../../data/app_text_styles.dart';
import '../../../data/image_path.dart';
import '../controllers/login_in_input_controller.dart';
import 'login_form.dart';

class LoginInInputView extends GetView<LoginInInputController> {
  const LoginInInputView({super.key});

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
                      Login_Form(),
                      SizedBox(height: 12.h),
                      Obx(
                        () => CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Forgot your password',
                            style: AppTextStyles.regular16.copyWith(
                              color: AppColors.greyTextColor,
                            ),
                          ),
                          value: controller.isChecked.value,
                          onChanged: (val) => controller.checked(),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              // Form is valid, proceed with login
                              controller.login();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBlack,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Log In',
                            style: AppTextStyles.regular16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Center(
                        child: Text(
                          'Or',
                          style: AppTextStyles.regular16.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.backGroundGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.white,
                                radius: 16.r,
                                child: Image.asset(
                                  ImagePath.googleIcon,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                'Login In With Google',
                                style: AppTextStyles.regular16.copyWith(
                                  color: AppColors.grey,
                                ),
                              ),
                            ],
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

