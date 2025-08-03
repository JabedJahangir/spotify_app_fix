import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';

class AlbumCardList extends StatelessWidget {
  const AlbumCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 1.2,
        color: AppColors.white,
        margin: EdgeInsets.symmetric(vertical: 10),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: 200,
          height: 64,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                    bottom: Radius.circular(8),
                  ),
                  child: Image.asset(
                    ImagePath.personImage,
                    height: 48,
                    width: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Music Name Here",style: AppTextStyles.regular16.copyWith(color: AppColors.black),),
                    Row(
                      children: [
                        Text("Michel Jaction",style: AppTextStyles.light10.copyWith(color: AppColors.black),),
                        const SizedBox(width: 3,),
                        Image.asset(ImagePath.dotIcon,scale: 3,),
                        const SizedBox(width: 3,),
                        Text("4:06 min",style: AppTextStyles.light10.copyWith(color: AppColors.black),),
                      ],
                    )

                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}