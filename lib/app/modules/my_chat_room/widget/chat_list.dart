
import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 1.2,
        color: AppColors.white,
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: 200,
          height: 64,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  child: Image.asset(
                    ImagePath.babyImage,
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
                        Text("George: This one’s going platinum",style: AppTextStyles.light12.copyWith(color: AppColors.greyTextColor),),
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