import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/home/widget/album_card.dart';
import 'package:tanit_tanit_app/app/modules/home/widget/home_carousel_slider.dart';
import 'package:tanit_tanit_app/app/modules/home/widget/party_list_card.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomAppBar(
              backGroundColor: AppColors.backGroundWhite,
              image: ImagePath.personImage,
              richText1: 'Hello, ',
              richText2: 'Remon Howlader',
              icon: Icons.notifications_none,
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Up coming Events',
                      style: AppTextStyles.bold16.copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    HomeCarouselSlider(selectedSlider: _selectedSlider),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trending Albums',
                      style: AppTextStyles.bold16.copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    GridView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.ARTIST_PROFILE);
                          },
                          child: AlbumCard(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weekly Listening Parties',
                      style: AppTextStyles.bold16.copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    GridView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.ARTIST_PROFILE);
                          },
                          child: PartyListCard(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
