import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/album/controllers/album_controller.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';
import '../../../models/album_model.dart';

class AlbumCardList extends StatelessWidget {
  final bool? showIcon;
  final String? image;
  final String albumName;
  final String artistName;
  final IconData icon;
  final Function()? onTap;

  const AlbumCardList({
    super.key,
    this.showIcon = false,
    this.image = ImagePath.ellipsisVertical,
    this.onTap,
    required this.albumName,
    required this.artistName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AlbumController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 1.2,
          color: AppColors.white,
          margin: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                    bottom: Radius.circular(8),
                  ),
                  child: Image.network(
                    image!,
                    height: 65,
                    width: 65,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback to local asset if network image fails
                      return Image.asset(
                        ImagePath.ellipsisVertical, // default image
                        height: 65,
                        width: 65,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),

                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        albumName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.regular16.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            artistName,
                            style: AppTextStyles.light10.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Image.asset(ImagePath.dotIcon, scale: 3),
                        ],
                      ),
                    ],
                  ),
                ),
                if (showIcon!)
                  Obx(() {
                    final selected = controller.isAlbumSelected(
                      albumName,
                      artistName,
                    );

                    return InkWell(
                      onTap: () {
                        controller.toggleAlbumSelection(
                          albumName,
                          artistName,
                          Album(
                            image: image!,
                            name: albumName,
                            artist: artistName,
                          ),
                        );
                      },
                      child: Icon(
                        selected ? Icons.favorite : icon,
                        color: selected ? Colors.red : Colors.grey,
                      ),
                    );
                  }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
