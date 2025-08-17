import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';

class AlbumCardList extends StatelessWidget {
  final bool? isTrue;
  final String? image;
  final String musicName;
  final String artistName;
  final Function()? onTap;

  const AlbumCardList({
    super.key,
    this.isTrue = false,
    this.image = ImagePath.ellipsisVertical,
    this.onTap,
    required this.musicName,
    required this.artistName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 1.2,
          color: AppColors.white,
          margin: EdgeInsets.symmetric(vertical: 10),
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
                  child: Image.network(image!, height: 65, fit: BoxFit.cover),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        musicName,
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
                          const SizedBox(width: 3),
                          // Text(
                          //   "4:06 min",
                          //   style: AppTextStyles.light10.copyWith(
                          //     color: AppColors.black,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Spacer(),
                // isTrue!
                //     ? GestureDetector(
                //         onTap: onTap,
                //         child: Image.asset(
                //           image!,
                //           height: 24,
                //           width: 24,
                //           fit: BoxFit.cover,
                //         ),
                //       )
                //     : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
