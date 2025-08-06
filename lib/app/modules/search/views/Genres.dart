import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

import '../widget/custom_search_frame.dart';

class Genres extends StatelessWidget {
  const Genres({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            Text('Genres', style: AppTextStyles.regular24),
            Wrap(
              children: List.generate(12, (index) {
                return SizedBox(
                    height: MediaQuery.of(context).orientation == Orientation.portrait
                        ? 110.h
                        : 300.h,
                    width: MediaQuery.of(context).orientation == Orientation.portrait
                        ? 66.w
                        : 69.w,
                    child: CustomSearchFrame());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
