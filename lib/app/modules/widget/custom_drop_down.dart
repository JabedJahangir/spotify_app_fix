import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

import '../../data/app_colors.dart';
import '../user_sign_up/controllers/user_sign_up_controller.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final String hintText;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;

  const CustomDropDown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.hintText,
    required this.onChanged, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<String>(
        validator: validator,
        isExpanded: true,
        hint: Text(
          hintText,
          style: AppTextStyles.regular16.copyWith(
            color: AppColors.greyTextColor,
          ),
        ),
        value: selectedValue,
        items: items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: AppTextStyles.regular16.copyWith(
                    color: AppColors.greyTextColor,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(color: AppColors.white),
        ),
        style: AppTextStyles.regular16.copyWith(color: AppColors.greyTextColor),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 24.sp,
            color: AppColors.greyTextColor,
          ),
        ),
        dropdownStyleData: DropdownStyleData(maxHeight: 250.h),
      ),
    );
  }
}
