import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/modules/artist_profile/widget/album_card_list.dart';
import '../../../routes/app_pages.dart';
import '../controllers/artist_profile_controller.dart';
import '../../widget/elevated_button_widget.dart';
import '../widget/tour_card.dart';

class ArtistProfileView extends GetView<ArtistProfileController> {
  const ArtistProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final artistName = args?["artistName"] ?? "Unknown Artist";
    final imageUrl = args?["imageUrl"] ?? "";
    final artistId = args?["artistId"] ?? "";
    // final albumId = args?["albumId"] ?? "";
    final artistAlbums =
        (Get.arguments['artistAlbums'] as List<Map<String, String>>?) ?? [];
    print(imageUrl);

    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: imageUrl.isNotEmpty
                          ? NetworkImage(imageUrl)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(artistName, style: AppTextStyles.medium16),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButtonWidget(
                        text: '${artistAlbums.length.toString()} albums',
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
                              text: 'Albums',
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
                              text: 'Tours',
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
              if (controller.isLoading.value) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200, // adjust height if needed
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                );
              }

              final selectedIndex = controller.selectedIndex.value;

              if (selectedIndex == 0) {
                return SliverList.builder(
                  itemCount: artistAlbums.length,
                  itemBuilder: (context, index) => AlbumCardList(
                    showIcon: true,
                    artistName: artistName,
                    albumName: artistAlbums[index]['name'] ?? 'Unknown Album',
                    image: artistAlbums[index]['image'] ?? '',
                    icon: Icons.favorite_outline_rounded,
                    onTap: () {
                      Get.toNamed(
                        Routes.ALBUM_CHAT_ROOM,
                        arguments: {
                          "artistId": artistId,
                          "albumId": artistAlbums[index]['id'],
                          "artistName": artistName,
                          "image": artistAlbums[index]['image'],
                          "albumName": artistAlbums[index]['name'],
                        },
                      );
                    },
                  ),
                );
              } else {
                return SliverList.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => TourCard(),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
