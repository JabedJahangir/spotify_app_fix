import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../controllers/album_selection_controller.dart';
import 'custom_gried_view_album.dart';

class AlbumSelectionView extends GetView<AlbumSelectionController> {
  const AlbumSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight.h),
        child: const CustomAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  'Your Sound, Your Community',
                  style: AppTextStyles.bold24.copyWith(fontSize: 24.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Select 3 albums to join their chatrooms and get started',
                  style: AppTextStyles.regular16.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.greyTextColor,
                  ),
                ),
                SizedBox(height: 16.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.w,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
                    child: CustomGriedViewAlbum(albumId: 'album_$index'),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 10,
        child: SizedBox(
          height: 60.h,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.CUSTOM_BOTTOM_NAVIGATION_BAR);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  foregroundColor: AppColors.white,
                  minimumSize: Size(double.infinity, 48.h),
                  textStyle: TextStyle(fontSize: 16.sp),
                ),
                child: const Text("Let's Start"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
