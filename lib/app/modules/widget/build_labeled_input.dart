import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/app_colors.dart';
import '../../data/app_text_styles.dart';

Widget CustomBuildLabeledInput(String label) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.regular12),
        SizedBox(height: 10.h),
        TextFormField(
          decoration: InputDecoration(
            hintText: label,
            hintStyle: AppTextStyles.regular16.copyWith(
              color: AppColors.greyTextColor,
            ),
          ),
        ),
      ],
    ),
  );
}
