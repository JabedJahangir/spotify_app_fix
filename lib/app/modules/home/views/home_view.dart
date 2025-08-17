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
            SliverToBoxAdapter(
              child: CustomAppBar(
                backGroundColor: AppColors.backGroundWhite,
                image: ImagePath.personImage,
                richText1: 'Hello, ',
                richText2: 'Remon Howlader',
                icon: Icons.notifications_none,
                iconPath: Routes.ALL_SEARCH,
              ),
            ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trending Albums',
                          style: AppTextStyles.bold16.copyWith(
                            color: AppColors.darkBlue,
                          ),
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: controller.toggleShowAll,
                            child: Text(
                              controller.showAll.value ? 'See less' : 'See all',
                              style: AppTextStyles.regular16.copyWith(
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return GridView.builder(
                        itemCount: controller.showAll.value
                            ? controller.trendingAlbums.length
                            : (controller.trendingAlbums.length > 2
                                  ? 2
                                  : controller.trendingAlbums.length),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 6,
                              crossAxisSpacing: 8,
                            ),
                        itemBuilder: (context, index) {
                          final album = controller.trendingAlbums[index];
                          final imageUrl = album["images"].isNotEmpty
                              ? album["images"][0]["url"]
                              : "";
                          final albumName = album["name"] ?? "Unknown Album";
                          final artistName =
                              album["artists"]
                                  ?.map((a) => a["name"])
                                  ?.join(", ") ??
                              "Unknown Artist";

                          return GestureDetector(
                            onTap: () async {
                              final artistId = album["artists"][0]["id"];
                              final artistData = await controller.spotifyService
                                  .getArtist(artistId);
                              final artistImage =
                                  artistData?["images"]?.isNotEmpty == true
                                  ? artistData!["images"][0]["url"]
                                  : "";
                              // Fetch all album names
                              final artistAlbums = await controller
                                  .spotifyService
                                  .getArtistAlbums(artistId);
                              print(
                                artistAlbums,
                              ); // This should print 22 albums

                              Get.toNamed(
                                Routes.ARTIST_PROFILE,
                                arguments: {
                                  "artistName": artistName,
                                  "albumName": albumName,
                                  "imageUrl": artistImage,
                                  "albumData": album,
                                  "artistAlbums":
                                      artistAlbums, // <-- key matches what you read later
                                },
                              );
                            },
                            child: AlbumCard(
                              albumName: albumName,
                              artistName: artistName,
                              imageUrl: imageUrl,
                              
                            ),
                          );
                        },
                      );
                    }),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Weekly Listening Parties',
                          style: AppTextStyles.bold16.copyWith(
                            color: AppColors.darkBlue,
                          ),
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: controller.toggleShowLess,
                            child: Text(
                              controller.showLess.value
                                  ? 'See all'
                                  : 'See less',
                              style: AppTextStyles.regular16.copyWith(
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => GridView.builder(
                        itemCount: controller.showLess.value ? 2 : 6,
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
