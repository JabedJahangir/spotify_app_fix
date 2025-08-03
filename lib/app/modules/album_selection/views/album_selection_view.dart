import 'package:flutter/material.dart';

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
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Sound, Your Community', style: AppTextStyles.bold24),
            Text(
              'Select 3 albums to join their chatrooms and get started',
              style: AppTextStyles.regular16.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .7,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 10,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: CustomGriedViewAlbum(albumId: 'album_$index'),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.CUSTOM_BOTTOM_NAVIGATION_BAR);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkBlue,
              ),
              child: Text("Let's Start"),
            ),
          ],
        ),
      ),
    );
  }
}


