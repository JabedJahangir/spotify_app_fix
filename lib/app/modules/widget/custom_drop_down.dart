import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/app_colors.dart';
import '../user_sign_up/controllers/user_sign_up_controller.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final String hintText;
  final void Function(String?) onChanged;

  const CustomDropDown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(hintText),
          value: selectedValue,
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
          buttonStyleData: ButtonStyleData(
            decoration: BoxDecoration(color: AppColors.white),
          ),
          style: const TextStyle(color: AppColors.greyTextColor),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down_outlined, size: 24,color: AppColors.greyTextColor,),
          ),
          dropdownStyleData: const DropdownStyleData(maxHeight: 300),
        ),
      ),
    );
  }
}
