import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

import '../../../data/image_path.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.darkBlue, AppColors.brightBlue],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage: AssetImage(ImagePath.personImage),
                        ),
                      ),
                      Text(
                        '@melodylover22',
                        style: AppTextStyles.medium20.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        'Living life one beat at a time.',
                        style: AppTextStyles.light16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                        Text('User Name', style: AppTextStyles.regular16),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 24),
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.edit,
                                color: AppColors.darkBlue,
                              ),
                              fillColor: AppColors.backGroundWhite,
                              hintText: '@melodylover22',
                            ),
                          ),
                        ),
                        Text('Bio', style: AppTextStyles.regular16),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 24),
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.edit,
                                color: AppColors.darkBlue,
                              ),
                              fillColor: AppColors.backGroundWhite,
                              hintText: 'Living life one beat at a time.',
                            ),
                          ),
                        ),
                        Text('Listening Time', style: AppTextStyles.regular16),
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
                                    'Total Minutes',
                                    style: AppTextStyles.regular16.copyWith(
                                      color: AppColors.greyTextColor,
                                    ),
                                  ),
                                  Text(
                                    '42305',
                                    style: AppTextStyles.regular16.copyWith(
                                      color: AppColors.greyTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text('Top Genre', style: AppTextStyles.regular16),
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
                                    'Indie Pop',
                                    style: AppTextStyles.regular16.copyWith(
                                      color: AppColors.greyTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text('Favorite Albums', style: AppTextStyles.regular16),
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
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_border_outlined,
                                        color: AppColors.greyTextColor,
                                      ),
                                      Text(
                                        'Favorite Albums',
                                        style: AppTextStyles.regular16.copyWith(
                                          color: AppColors.greyTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '23',
                                    style: AppTextStyles.regular16.copyWith(
                                      color: AppColors.greyTextColor,
                                    ),
                                  ),
                                ],
                              ),
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

                                  SizedBox(
                                    height: 30,
                                    width: 50,
                                    child: Obx(
                                      () => GestureDetector(
                                        onTap:
                                            controller.togglePlayInBackground,
                                        child: Container(
                                          height: 25,
                                          width: 46,
                                          decoration: BoxDecoration(
                                            color: AppColors.darkBlue,
                                            borderRadius: BorderRadius.circular(
                                              45,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                  color:
                                                      controller
                                                          .isPlayInBackground
                                                          .value
                                                      ? AppColors.white
                                                      : AppColors.darkBlue,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              Container(
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                  color:
                                                      controller
                                                          .isPlayInBackground
                                                          .value
                                                      ? AppColors.darkBlue
                                                      : AppColors.white,
                                                  shape: BoxShape.circle,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 24),
                          child: Container(
                            color: AppColors.backGroundWhite,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Icon(Icons.logout),
                                  SizedBox(width: 5),
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
