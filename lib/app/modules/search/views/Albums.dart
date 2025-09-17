import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

import '../../artist_profile/widget/album_card_list.dart';
import '../controllers/search_controller.dart';

class Albums extends StatelessWidget {
  const Albums({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomSearchController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text("Albums", style: AppTextStyles.regular24),
        ),
        Expanded(
          child: Obx(() {
            if (controller.albums.isEmpty) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("No albums found"),
              );
            }

            return ListView.builder(
              itemCount: controller.albums.length,
              itemBuilder: (context, index) {
                final album = controller.albums[index];
                return AlbumCardList(
                  artistName: album['artist'] ?? '', // if you have artist
                  albumName: album['name'] ?? '',
                  icon: Icons.favorite_outline_rounded,
                  image: album['image_url'] ?? '',
                  showIcon: false,
                  albumId: '',
                  artistId: '',
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
