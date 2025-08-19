import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

class PartyListCard extends StatelessWidget {
  final String trackName;
  final String imageUrl;
  final String artistName;
  final String time;
  final String date;

  const PartyListCard({
    super.key,
    required this.trackName,
    required this.imageUrl,
    this.artistName = '',
    this.time = '11:30 PM',
    this.date = '1 Feb, 2025',
  });

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
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      height: 110,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      ImagePath.musicImage,
                      height: 110,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            // Wrap text section in Expanded
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            trackName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.regular14.copyWith(
                              color: AppColors.black,
                              letterSpacing: 0.01,
                            ),
                          ),
                        ),
                        Text(
                          time,
                          style: AppTextStyles.light8.copyWith(
                            color: AppColors.black,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ],
                    ),
                    if (artistName.isNotEmpty)
                      Text(
                        artistName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.light10.copyWith(
                          color: AppColors.darkGrey,
                        ),
                      ),
                    Text(
                      date,
                      style: AppTextStyles.light10.copyWith(
                        color: AppColors.darkGrey,
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
