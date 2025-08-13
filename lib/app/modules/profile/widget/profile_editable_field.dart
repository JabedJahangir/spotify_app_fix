// widgets/profile_editable_field.dart
import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

class ProfileEditableField extends StatelessWidget {
  final String label;
  final String hintText;

  const ProfileEditableField({
    Key? key,
    required this.label,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.regular16),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 24),
          child: TextFormField(
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.edit,
                color: AppColors.darkBlue,
              ),
              fillColor: AppColors.backGroundWhite,
              hintText: hintText,
              hintStyle: AppTextStyles.regular16.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
