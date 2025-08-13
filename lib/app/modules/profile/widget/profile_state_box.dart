// widgets/profile_stat_box.dart
import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

class ProfileStatBox extends StatelessWidget {
  final String title;
  final String value;
  final Widget? icon;

  const ProfileStatBox({
    Key? key,
    required this.title,
    required this.value, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      child: Container(
        color: AppColors.backGroundWhite,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ?icon,
                  Text(
                    title,
                    style: AppTextStyles.regular16.copyWith(
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ],
              ),
              Text(
                value,
                style: AppTextStyles.regular16.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
