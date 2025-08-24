import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/app_text_styles.dart';
import '../../../data/image_path.dart';

class CustomSearchFrame extends StatelessWidget {
  const CustomSearchFrame({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Padding(
      padding: EdgeInsets.only(right: 16.w, top: 12.h, bottom: 12.h),
      child: SizedBox(
        width: isPortrait ? 80.w : 120.w,
        child: Column(
          children: [
            Expanded(
              child: CircleAvatar(
                radius: isPortrait ? 40.r : 60.r,
                backgroundColor: Colors.transparent,
                backgroundImage: imageUrl.isNotEmpty
                    ? NetworkImage(imageUrl)
                    : AssetImage(ImagePath.personImage) as ImageProvider,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: AppTextStyles.light12.copyWith(fontSize: 12.sp),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
