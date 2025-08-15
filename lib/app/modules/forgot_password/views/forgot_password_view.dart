import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';
import '../../widget/custom_app_bar.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  ForgotPasswordView({super.key});

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
                      Text('Forgot Password?', style: AppTextStyles.bold20),
                      Text(
                        'Please write your email to receive a confirmation code to set a new password',
                        style: AppTextStyles.regular12,
                      ),
                      SizedBox(height: 20.h),
                      Text('Email', style: AppTextStyles.regular12),
                      SizedBox(height: 10.h),
                      Form(
                        key: controller.formKey,
                        child: TextFormField(
                          controller: controller.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: AppTextStyles.regular16.copyWith(
                              color: AppColors.greyTextColor,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.resetPassword();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBlack,
                          ),
                          child: Text(
                            'Confirm Email',
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
