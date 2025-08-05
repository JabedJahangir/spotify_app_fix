import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

import '../widget/custom_search_frame.dart';

class All extends StatelessWidget {
  All({super.key});

  @override
  Widget build(BuildContext context) {
    // Make sure ScreenUtil.init() is called in your app entry point

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),

            Text(
              'Recent Searches',
              style: AppTextStyles.regular24.copyWith(fontSize: 24.sp),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Wrap(
                spacing: 12.w, // horizontal spacing
                runSpacing: 12.h, // vertical spacing
                children: List.generate(10, (index) {
                  return Chip(
                    label: Text(
                      'wokka wokka',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyles.regular16.copyWith(fontSize: 16.sp),
                    ),
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.r),
                      side: BorderSide(color: AppColors.white),
                    ),
                  );
                }),
              ),
            ),

            Text(
              'Artists',
              style: AppTextStyles.regular24.copyWith(fontSize: 24.sp),
            ),

            SizedBox(
              height: 140.h,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => CustomSearchFrame(),
              ),
            ),

            SizedBox(height: 20.h),

            Text(
              'Genres',
              style: AppTextStyles.regular24.copyWith(fontSize: 24.sp),
            ),

            SizedBox(
              height: 140.h,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) => CustomSearchFrame(),
              ),
            ),

            SizedBox(height: 20.h),

            Text(
              'Albums',
              style: AppTextStyles.regular24.copyWith(fontSize: 24.sp),
            ),

            SizedBox(
              height: 140.h,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => CustomSearchFrame(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
