import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/home/views/widget/album_card.dart';
import 'package:tanit_tanit_app/app/modules/home/views/widget/home_carousel_slider.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Column(children: [CustomAppBar()])),
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
                        return AlbumCard();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


