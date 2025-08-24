import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/modules/search/controllers/search_controller.dart';

class Genres extends StatelessWidget {
  const Genres({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomSearchController>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Genres', style: AppTextStyles.regular24),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.genres.isEmpty) {
                return const Text(
                  'No genres found. Please search to see results.',
                );
              }
              return Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                children: controller.genres
                    .map(
                      (genre) => ActionChip(
                        label: Text(
                          genre,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.light14.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45.r),
                        ),
                        onPressed: () {
                          controller.search(genre);

                          // 🔥 Switch to "All" tab (index 0)
                          final tabController = DefaultTabController.of(
                            context,
                          );
                          tabController.animateTo(0);
                        },
                        // 🔥 search again
                      ),
                    )
                    .toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
