import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

import '../widget/custom_search_frame.dart';

class All extends StatelessWidget {
  const All({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
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
                spacing: 12.w,
                runSpacing: 12.h,
                children: List.generate(10, (index) {
                  return Chip(
                    label: Text(
                      'wokka wokka',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyles.light14.copyWith(fontSize: 16.sp),
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
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 100.h
                  : 250.h,
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
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 100.h
                  : 250.h,
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
              'Albums',
              style: AppTextStyles.regular24.copyWith(fontSize: 24.sp),
            ),
            SizedBox(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 100.h
                  : 250.h,
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
