import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/app_text_styles.dart';
import '../controllers/search_controller.dart';
import '../widget/custom_search_frame.dart';

class Artists extends StatelessWidget {
  const Artists({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomSearchController>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Artists',
              style: AppTextStyles.regular24.copyWith(fontSize: 24.sp),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.artists.isEmpty) {
                return const Text(
                  'No artists found. Please search for artists.',
                );
              }
              return Wrap(
                children: List.generate(controller.artists.length, (index) {
                  return SizedBox(
                    height: 120.h,
                    width: 80.w,
                    child: CustomSearchFrame(
                      title: controller.artists[index]['name'] ?? 'Unknown',
                      imageUrl: controller.artists[index]['image_url'] ?? '',
                    ),
                  );
                }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
