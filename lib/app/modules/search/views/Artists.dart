import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/app_text_styles.dart';
import '../widget/custom_search_frame.dart';

class Artists extends StatelessWidget {
  const Artists({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text('Artists', style: AppTextStyles.regular24.copyWith(fontSize: 24.sp)),
            SizedBox(height: 16.h),
            Wrap(
              children: List.generate(12,(index){
                return CustomSearchFrame();
              }),
            )
          ],
        ),
      ),
    );
  }
}
