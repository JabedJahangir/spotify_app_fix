import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../../widget/custom_drop_down.dart';
import '../controllers/user_sign_up_controller.dart';

class UserSignUpView extends GetView<UserSignUpController> {
  const UserSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DottedBorder(
                      borderType: BorderType.Circle,
                      color: Color(0xFF3465C2),
                      dashPattern: [4, 3],
                      strokeWidth: 1.w,
                      child: Container(
                        width: 64.w,
                        height: 64.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFECECEC),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: Color(0xFFDBE7FF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text('Profile Picture'),
                    SizedBox(height: 8.h),
                    Container(
                      height: 33.h,
                      width: 153.w,
                      color: AppColors.backGroundGrey,
                      child: Center(child: Text('Upload an Image')),
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('First Name'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: AppTextStyles.regular16.copyWith(
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                        ),
                        Text('Last Name'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: AppTextStyles.regular16.copyWith(
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                        ),
                        Text('User Name'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'User Name',
                              hintStyle: AppTextStyles.regular16.copyWith(
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                        ),
                        Text('Date of Birth'),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Obx(
                              () => CustomDropDown(
                                items: controller.months,
                                selectedValue: controller.selectedMonth.value,
                                hintText: 'Month',
                                onChanged: (val) =>
                                    controller.selectedMonth(val!),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Obx(
                              () => CustomDropDown(
                                items: controller.days,
                                selectedValue: controller.selectedDay.value,
                                hintText: 'Day',
                                onChanged: (val) =>
                                    controller.selectedMonth(val!),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Obx(
                              () => CustomDropDown(
                                items: controller.years,
                                selectedValue: controller.selectedYear.value,
                                hintText: 'Year',
                                onChanged: (val) =>
                                    controller.selectedMonth(val!),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Text('Email'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: AppTextStyles.regular16.copyWith(
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                        ),
                        Text('Password'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: AppTextStyles.regular16.copyWith(
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text('Remember Me'),
                            value: controller.isChecked.value,
                            onChanged: (val) {
                              controller.checked();
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.FINISH);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBlack,
                            foregroundColor: AppColors.white,
                          ),
                          child: Text('Sign Up'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
