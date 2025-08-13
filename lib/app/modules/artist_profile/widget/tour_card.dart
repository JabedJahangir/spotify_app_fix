import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

class TourCard extends StatelessWidget {
  const TourCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,),
      child: Card(
        color: AppColors.white,
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                    bottom: Radius.circular(8),
                  ),
                  child: Image.asset(
                    ImagePath.notificatonImage,scale: 3,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dhaka, Bangladesh",
                      style: AppTextStyles.regular16.copyWith(
                        color: AppColors.black,letterSpacing: 0.1,
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
                   height: 42.h,
                  width: 92.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkBlue,
                      padding: EdgeInsets.symmetric(horizontal: 6,),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'Buy Ticket',
                            style: AppTextStyles.regular12.copyWith(
                              color: AppColors.white,
                              letterSpacing: 0.01,
                            ),
                          ),
                          const SizedBox(width: 3,),
                          Image.asset(ImagePath.arrowUP, scale: 3),
                        ],
                      ),
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
