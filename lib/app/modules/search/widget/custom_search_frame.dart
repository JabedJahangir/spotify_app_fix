
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/app_text_styles.dart';
import '../../../data/image_path.dart';

class CustomSearchFrame extends StatelessWidget {
  const CustomSearchFrame({super.key,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, top: 16.h, bottom: 16.h),
      child: SizedBox(
        width: 50.w,
        height: 60.h,
        child: Column(
          children: [
            Expanded(
              child: CircleAvatar(
                radius: MediaQuery.of(context).orientation == Orientation.portrait ? 50.r : 80.r,
                backgroundImage: AssetImage(ImagePath.personImage),
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: 50.w,
              child: Center(
                child: Text(
                  'Cardi Bvfgf',
                  style: AppTextStyles.light12,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
