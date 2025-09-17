import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/modules/artist_profile/widget/album_card_list.dart';
import '../../../routes/app_pages.dart';
import '../controllers/album_controller.dart';

class AlbumView extends GetView<AlbumController> {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text('Favourite Albums', style: AppTextStyles.medium24),
      ),
      body: Obx(() {
        if (controller.favouriteAlbums.isEmpty) {
          return const Center(
            child: Text(
              "No favourite album added yet",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.favouriteAlbums.length,
          itemBuilder: (context, index) {
            final album = controller.favouriteAlbums[index]; // <-- Album object
            return AlbumCardList(
              artistName: album.artist, // dot notation
              albumName: album.name,
              image: album.image,
              icon: Icons.favorite,
              showIcon: false, // show the heart icon
              albumId: album.id, // ✅ now available
              artistId: album.artistId, // ✅ now available
              onTap: () {
                Get.toNamed(
                  Routes.ALBUM_CHAT_ROOM,
                  arguments: {
                    "artistId": album.artistId,
                    "albumId": album.id,
                    "artistName": album.artist,
                    "image": album.image,
                    "albumName": album.name,
                  },
                );
              },
            );
          },
        );
      }),
    );
  }
}
