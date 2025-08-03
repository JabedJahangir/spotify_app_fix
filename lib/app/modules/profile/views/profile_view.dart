import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/profile/widget/album_card_list.dart';
import '../controllers/profile_controller.dart';
import '../widget/elevated_button_widget.dart';
import '../widget/tour_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(ImagePath.personImage),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text('Artist Name', style: AppTextStyles.medium16),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButtonWidget(
                        text: '6 Albums',
                        backgroundColor: AppColors.lavenderLight,
                        textColor: AppColors.darkBlue,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 5),
                      ElevatedButtonWidget(
                        text: '24 songs',
                        backgroundColor: AppColors.lavenderLight,
                        textColor: AppColors.darkBlue,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 61,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(57),
                      ),
                      child: Obx(() {
                        final selected = controller.selectedIndex.value;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButtonWidget(
                              onPressed: () {
                                controller.valueSelected(0);
                              },
                              text: 'Tour',
                              fontSize: 16,
                              height: 37,
                              width: 164.5,
                              textColor: selected == 0
                                  ? AppColors.white
                                  : AppColors.black,
                              backgroundColor: selected == 0
                                  ? AppColors.darkBlue
                                  : AppColors.white,
                            ),
                            const SizedBox(width: 14),
                            ElevatedButtonWidget(
                              onPressed: () {
                                controller.valueSelected(1);
                              },
                              text: 'Albums',
                              fontSize: 16,
                              height: 37,
                              width: 164.5,
                              textColor: selected == 1
                                  ? AppColors.white
                                  : AppColors.black,
                              backgroundColor: selected == 1
                                  ? AppColors.darkBlue
                                  : AppColors.white,
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              final selectedIndex=controller.selectedIndex.value;
              if(selectedIndex==0){
                return  SliverList.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => TourCard(),
                );
              }
              else{
                return SliverList.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => AlbumCardList(),
                );
              }
            },)
          ],
        ),
      ),
    );
  }
}
