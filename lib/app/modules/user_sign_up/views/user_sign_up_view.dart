import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../../widget/build_labeled_input.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DottedBorder(
                borderType: BorderType.Circle,
                color: const Color(0xFF3465C2),
                dashPattern: [4, 3],
                strokeWidth: 1.w,
                child: Container(
                  width: 64.w,
                  height: 64.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFECECEC),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFFDBE7FF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text('Profile Picture', style: AppTextStyles.regular12),
              SizedBox(height: 8.h),
              Container(
                height: 33.h,
                width: 153.w,
                color: AppColors.backGroundGrey,
                child: const Center(child: Text('Upload an Image')),
              ),
              SizedBox(height: 20.h),
              CustomBuildLabeledInput('First Name'),
              CustomBuildLabeledInput('Last Name'),
              CustomBuildLabeledInput('User Name'),
              Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Date of Birth', style: AppTextStyles.regular12)),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: Obx(() => CustomDropDown(
                      items: controller.months,
                      selectedValue: controller.selectedMonth.value,
                      hintText: 'Month',
                      onChanged: (val) => controller.selectedMonth(val!),
                    )),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Obx(() => CustomDropDown(
                      items: controller.days,
                      selectedValue: controller.selectedDay.value,
                      hintText: 'Day',
                      onChanged: (val) => controller.selectedDay(val!),
                    )),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Obx(() => CustomDropDown(
                      items: controller.years,
                      selectedValue: controller.selectedYear.value,
                      hintText: 'Year',
                      onChanged: (val) => controller.selectedYear(val!),
                    )),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              CustomBuildLabeledInput('Email'),
              CustomBuildLabeledInput('Password'),
              Obx(() => CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title:  Text('Remember Me',style: AppTextStyles.regular16,),
                value: controller.isChecked.value,
                onChanged: (val) => controller.checked(),
                controlAffinity: ListTileControlAffinity.leading,
              )),
              SizedBox(height: 10.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.FINISH),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightBlack,
                    foregroundColor: AppColors.white,
                  ),
                  child: const Text('Sign Up'),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

}


