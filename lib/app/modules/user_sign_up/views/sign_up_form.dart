import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';
import '../../widget/custom_drop_down.dart';
import '../controllers/user_sign_up_controller.dart';

class SignUpForm extends GetView<UserSignUpController> {
  SignUpForm({super.key, required this.controller});

  final List<String> existingUsernames = ['admin', 'johndoe', 'flutter_dev'];
  @override
  final UserSignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('First Name', style: AppTextStyles.regular12),
          TextFormField(
            controller: controller.firstNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter your valid name";
              }
              if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                return "Please Enter a valid Name(only letters and spaces)";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'First Name',
              hintStyle: AppTextStyles.regular16.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text('Last Name', style: AppTextStyles.regular12),
          TextFormField(
            controller: controller.lastNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter your valid name";
              }
              if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                return "Please Enter a valid Name(only letters and spaces)";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Last Name',
              hintStyle: AppTextStyles.regular16.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text('User Name', style: AppTextStyles.regular12),
          TextFormField(
            controller: controller.userNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a username';
              }
              if (existingUsernames.contains(value.toLowerCase())) {
                return 'This username is already taken. Please choose another.';
              }
              if (!RegExp(r"^[a-zA-Z0-9_]{4,20}$").hasMatch(value)) {
                return 'Invalid username format(4-20 chars, letters/numbers/_ only)';
              }
            },
            decoration: InputDecoration(
              hintText: 'User Name',
              hintStyle: AppTextStyles.regular16.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text('Date of Birth', style: AppTextStyles.regular12),
          ),
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => CustomDropDown(
                    validator: (value){
                      if(value == null){
                        return 'Please select an option';
                      } else {
                        null;
                      }
                      return null;
                    },
                    items: controller.months,
                    selectedValue: controller.selectedMonth.value,
                    hintText: 'Month',
                    onChanged: (val) => controller.selectedMonth(val!),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Obx(
                  () => CustomDropDown(
                    validator: (value) => value == null ? 'Please select an option' : null,
                    items: controller.days,
                    selectedValue: controller.selectedDay.value,
                    hintText: 'Day',
                    onChanged: (val) => controller.selectedDay(val!),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Obx(
                  () => CustomDropDown(
                    validator: (value) => value == null ? 'Please select an option' : null,
                    items: controller.years,
                    selectedValue: controller.selectedYear.value,
                    hintText: 'Year',
                    onChanged: (val) => controller.selectedYear(val!),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text('Email', style: AppTextStyles.regular12),
          TextFormField(
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
          SizedBox(height: 8.h),
          Text('Password', style: AppTextStyles.regular12),
          TextFormField(
            controller: controller.passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              if (value.length < 6) {
                return "Password must be at least 6 characters long";
              }
            },
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: AppTextStyles.regular16.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
