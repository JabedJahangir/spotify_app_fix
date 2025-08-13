import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';
import '../../../data/image_path.dart';

class CustomProfileContainer extends StatelessWidget {
  const CustomProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
      MediaQuery.of(context).orientation == Orientation.portrait
          ? 220.h
          : 350.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.darkBlue, AppColors.brightBlue],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 70.r,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 65.r,
              backgroundImage: AssetImage(ImagePath.personImage),
            ),
          ),
          Text(
            '@melodylover22',
            style: AppTextStyles.medium20.copyWith(
              color: AppColors.white,
            ),
          ),
          Text(
            'Living life one beat at a time.',
            style: AppTextStyles.light16.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}