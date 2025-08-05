import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 172.5,
        height: 143,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                ImagePath.musicImage,
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Music Album Name',
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "Michel Jaction",
                    style: AppTextStyles.light10.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
