import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/modules/profile/widget/profile_editable_field.dart';

import '../../album/controllers/album_controller.dart';
import '../controllers/profile_controller.dart';
import '../widget/custom_profile_container.dart';
import '../widget/custom_toggle_button.dart';
import '../widget/profile_state_box.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final albumController = Get.find<AlbumController>();
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomProfileContainer(),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileEditableField(
                          label: 'User Name',
                          hintText: '@melodylover22',
                        ),
                        ProfileEditableField(
                          label: 'Bio',
                          hintText: 'Living life one beat at a time.',
                        ),
                        ProfileStatBox(title: 'Total Minutes', value: '42305'),
                        ProfileStatBox(title: 'Top Genre', value: 'Indie Pop'),
                        Obx(
                          () => ProfileStatBox(
                            title: 'Favorite Albums',
                            value: albumController.favouriteAlbums.length
                                .toString(),
                            icon: Icon(
                              Icons.star_border_outlined,
                              color: AppColors.greyTextColor,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 24),
                          child: Container(
                            color: AppColors.backGroundWhite,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Play In Background',
                                    style: AppTextStyles.regular16.copyWith(
                                      color: AppColors.greyTextColor,
                                    ),
                                  ),
                                  ToggleButton(controller: controller),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 24),
                          child: GestureDetector(
                            onTap: signOut,
                            child: Container(
                              color: AppColors.backGroundWhite,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.logout),
                                    SizedBox(width: 5.w),
                                    Text(
                                      'Log out',
                                      style: AppTextStyles.regular16.copyWith(
                                        color: AppColors.greyTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
