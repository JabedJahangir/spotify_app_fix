import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../widget/custom_app_bar.dart';
import '../controllers/verify_email_address_controller.dart';

class VerifyEmailAddressView extends GetView<VerifyEmailAddressController> {
  const VerifyEmailAddressView({super.key});
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
                      Text('Verify email address', style: AppTextStyles.bold20),
                      SizedBox(height: 8.h),
                      // New header
                      Text(
                        'A confirmation link has been sent to your email',
                        style: AppTextStyles.regular16,
                      ),
                      SizedBox(height: 8.h),
                      // Description
                      Text(
                        'Please check your inbox for the confirmation email. '
                        'If you don’t see it, check your spam folder or promotions tab.',
                        style: AppTextStyles.regular12,
                      ),
                      SizedBox(height: 24.h),
                      // Confirm button
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.LOGIN_IN_INPUT);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBlack,
                          ),
                          child: Text(
                            'Okay',
                            style: AppTextStyles.regular16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: 16.h),
                      // Obx(
                      //   () => RichText(
                      //     text: TextSpan(
                      //       children: [
                      //         TextSpan(
                      //           text: controller.timerText.value,
                      //           style: TextStyle(
                      //             fontSize: 12.sp,
                      //             fontWeight: FontWeight.w900,
                      //             color: AppColors.blue,
                      //           ),
                      //         ),
                      //         // WidgetSpan(
                      //         //   child: GestureDetector(
                      //         //     onTap: controller.resendCode,
                      //         //     child: Padding(
                      //         //       padding: EdgeInsets.only(left: 8.w),
                      //         //       child: Text(
                      //         //         'Resend Confirmation Email',
                      //         //         style: AppTextStyles.regular12.copyWith(
                      //         //           color:
                      //         //               controller.timerText.value ==
                      //         //                   "00:00"
                      //         //               ? AppColors.black
                      //         //               : AppColors.black.withOpacity(0.5),
                      //         //         ),
                      //         //       ),
                      //         //     ),
                      //         //   ),
                      //         // ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
