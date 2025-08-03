import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

class TourCard extends StatelessWidget {
  const TourCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: AppColors.white,
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: double.infinity,
          height: 90,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                    bottom: Radius.circular(8),
                  ),
                  child: Image.asset(
                    ImagePath.notificatonImage,
                    height: 48,
                    width: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dhaka, Bangladesh",
                      style: AppTextStyles.regular16.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      "Jul 29, 2019 23:14",
                      style: AppTextStyles.light10.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      "KA-244, Kuril, Progoti Shoroni,",
                      style: AppTextStyles.light10.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      "Dhaka",
                      style: AppTextStyles.light10.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 34,
                  width: 102,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightBlue,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Buy Ticket',
                          style: AppTextStyles.medium12.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        Spacer(),
                        Image.asset(ImagePath.arrowUP, scale: 3),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
