import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/search_controller.dart';
import '../widget/custom_search_frame.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

class All extends StatelessWidget {
  const All({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomSearchController>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Searches',
                  style: AppTextStyles.regular24.copyWith(fontSize: 24.sp),
                ),
                InkWell(
                  onTap: controller.clearRecentSearches,
                  child: Text('clear all'),
                ),
              ],
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.recentSearches.isEmpty) {
                return const Text('No recent searches');
              }
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: controller.recentSearches
                      .map(
                        (query) => ActionChip(
                          label: Text(
                            query,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.light14.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.r),
                          ),
                          onPressed: () => controller.search(
                            query,
                          ), // 🔥 directly call search
                        ),
                      )
                      .toList(),
                ),
              );
            }),
            SizedBox(height: 20.h),

            /// Artists
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
                  'No artists found. Please search to see results.',
                );
              }
              return SizedBox(
                height: 120.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.artists.length,
                  itemBuilder: (context, index) {
                    final artist = controller.artists[index];
                    return CustomSearchFrame(
                      title: artist['name'] ?? '',
                      imageUrl: artist['image_url'] ?? '',
                    );
                  },
                ),
              );
            }),
            SizedBox(height: 20.h),

            /// Albums
            Text(
              'Albums',
              style: AppTextStyles.regular24.copyWith(fontSize: 24.sp),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.albums.isEmpty) {
                return const Text(
                  'No albums found. Please search to see results.',
                );
              }
              return SizedBox(
                height: 120.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.albums.length,
                  itemBuilder: (context, index) {
                    final album = controller.albums[index];
                    return CustomSearchFrame(
                      title: album['name'] ?? '',
                      imageUrl: album['image_url'] ?? '',
                    );
                  },
                ),
              );
            }),
            SizedBox(height: 20.h),

            /// Genres
            Text(
              'Genres',
              style: AppTextStyles.regular24.copyWith(fontSize: 24.sp),
            ),
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
                        onPressed: () =>
                            controller.search(genre), // 🔥 search again
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
