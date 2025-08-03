import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

import '../../data/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String? image;
  final String? richText1;
  final String? richText2;
  final String? title;
  final IconData? icon;
  final Color? backGroundColor;
  final Function()? backRoutes;

  const CustomAppBar({
    super.key,
    this.image,
    this.icon,
    this.richText1,
    this.richText2,
    this.title,
    this.backGroundColor = AppColors.backGroundWhite, this.backRoutes,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGroundColor,
      leadingWidth: 56,
      leading: Padding(
        padding: EdgeInsets.only(left: 16),
        child: CircleAvatar(
          // choto hoye jay
          radius: 28,
          backgroundColor: AppColors.blue,
          child: image != null
              ? ClipOval(child: Image.asset(image!, fit: BoxFit.cover))
              : IconButton(
              onPressed: (){
                Get.back();
              },
              icon:Icon(Icons.arrow_back), color: AppColors.white, iconSize: 24,),
        ),
      ),
      title: RichText(
        text: richText1 != null
            ? TextSpan(
                children: [
                  TextSpan(
                    text: richText1,
                    style: TextStyle(color: AppColors.darkBlue, fontSize: 16),
                  ),
                  TextSpan(
                    text: richText2,
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            : TextSpan(
                text: title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {},
            child: Icon(icon, color: AppColors.darkBlue, size: 40),
          ),
        ),
      ],
    );
  }
}
