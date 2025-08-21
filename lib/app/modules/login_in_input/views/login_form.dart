import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';
import '../controllers/login_in_input_controller.dart';

class LoginForm extends GetView<LoginInInputController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email', style: AppTextStyles.regular12),
          SizedBox(height: 10.h),
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
          SizedBox(height: 16.h),
          Text('Password', style: AppTextStyles.regular12),
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
