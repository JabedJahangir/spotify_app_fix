import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/app_text_styles.dart';
import '../../../data/image_path.dart';

class CustomSearchFrame extends StatelessWidget {
  const CustomSearchFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, top: 16.h, bottom: 16.h),
      child: SizedBox(
        width: 60.w, // Adjusted to a responsive size
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: 8.h,
                child: CircleAvatar(
                  maxRadius: 30.r, // Adjusted to a responsive size
                  backgroundImage: AssetImage(ImagePath.personImage),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 8.h), // Adjusted to a responsive size
            Text(
              'Cardi B',
              style: AppTextStyles.light12.copyWith(fontSize: 12.sp),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}