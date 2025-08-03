import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../controllers/platforms_link_controller.dart';

class PlatformsLinkView extends GetView<PlatformsLinkController> {
  const PlatformsLinkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*.13,
              ),
              Text('🎵 Add Your Spotify', style: AppTextStyles.bold24),
              Text(
                'Connect your account so we can discover the albums and artists that shape your vibe.',
                style: AppTextStyles.regular16.copyWith(
                  color: AppColors.greyTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.4,
              ),
              ElevatedButton(onPressed: (){
                Get.toNamed(Routes.ALBUM_SELECTION);
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backGroundBlack,
                  ),
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset(ImagePath.spotify,height: 32,width: 32,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.01,
                ),
                Text('Log In with Spotify',style: AppTextStyles.medium16.copyWith(color: AppColors.white),),
              ],)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(onPressed: (){
                  Get.toNamed(Routes.ALBUM_SELECTION);

                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.backGroundBlack,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImagePath.logo,height: 32,width: 32,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.01,
                        ),
                        Text('Log In with Deezer',style: AppTextStyles.medium16.copyWith(color: AppColors.white),),
                      ],)),
              ),
              ElevatedButton(onPressed: (){
                Get.toNamed(Routes.ALBUM_SELECTION);
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backGroundBlack,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImagePath.apple,height: 32,width: 32,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.01,
                      ),
                      Text('Log In with Apple',style: AppTextStyles.medium16.copyWith(color: AppColors.white),),
                    ],)),
            ],
          ),
        ),
      ),
    );
  }
}
